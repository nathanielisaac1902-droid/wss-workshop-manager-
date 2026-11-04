ElevatedButton(
  onPressed: () {
    Navigator.popUntil(context, (route) => route.isFirst);
  },
  child: const Text('Order Finalized'),
)