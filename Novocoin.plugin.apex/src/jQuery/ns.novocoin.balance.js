// Load Web3 library dynamically if not already present
if (typeof window.Web3 === 'undefined') {
    var script = document.createElement('script');
    script.src = 'https://cdn.jsdelivr.net/npm/web3@1.10.0/dist/web3.min.js';
    document.head.appendChild(script);
}

(function ($) {
    async function NovocoinBalancePlugin(pConfig) {
        const region$ = $('#' + pConfig.containerId);

        // DOM elements within the plugin container
        const status$ = region$.find('.novocoin-status-message'); // Optional status message
        const result$ = region$.find('.novocoin-balance');        // Area to display the token balance
        const error$ = region$.find('.novocoin-error');          // Area to display errors

        // Hide all UI elements before updating content
        function resetUI() {
            status$.hide();
            result$.hide();
            error$.hide();
        }

        // Check if required configuration values are present
        if (!pConfig.contractAddress) {
            resetUI();
            error$.text('Error: Contract address not provided.').show();
            return;
        }

        if (!pConfig.personalAddress) {
            resetUI();
            error$.text('Error: Personal address not provided.').show();
            return;
        }

        // Minimal ABI with only the balanceOf method (standard for ERC-20)
        const abi = [{
            constant: true,
            inputs: [{ name: 'tokenOwner', type: 'address' }],
            name: 'balanceOf',
            outputs: [{ name: 'balance', type: 'uint256' }],
            type: 'function'
        }];

        const contractAddress = pConfig.contractAddress;
        const address = pConfig.personalAddress;

        // Retrieve the token balance using Web3 and MetaMask
        async function getBalance(address) {
            // MetaMask must be available in the browser
            if (!window.ethereum) {
                resetUI();
                error$.text('MetaMask not detected. Please install it to continue.').show();
                return null;
            }

            const web3 = new Web3(window.ethereum);

            try {
                // Ask user to connect their wallet
                await window.ethereum.request({ method: 'eth_requestAccounts' });
            } catch (requestErr) {
                resetUI();
                if (requestErr.code === 4001) {
                    error$.text('Access denied by the user.').show();
                } else {
                    error$.text('Failed to request wallet access.').show();
                }
                return null;
            }

            // Create the contract instance and call balanceOf
            const contract = new web3.eth.Contract(abi, contractAddress);
            const balance = await contract.methods.balanceOf(address).call();
            return balance;
        }

        // Format balance as an integer with thousand separators (dot) and ignore decimals
        function formatBalance(rawBalance) {
            // Convert from wei-like format to integer (remove last 18 decimals)
            const integerPart = BigInt(rawBalance) / 100n;
            // Format with dot as thousands separator
            return integerPart.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
        }

        // Main logic: fetch and display balance
        try {
            resetUI();
            result$.text('Loading balance...').show();

            const balance = await getBalance(address);
            if (balance === null) return;

            const formatted = formatBalance(balance);

            resetUI();
            result$.text(`Balance: ${formatted} coins`).show();
        } catch (err) {
            console.error('Error retrieving balance:', err);
            resetUI();
            error$.text('Error retrieving balance.').show();
        }
    }

    // Expose plugin to global scope
    window.NovocoinBalancePlugin = NovocoinBalancePlugin;

})(apex.jQuery);