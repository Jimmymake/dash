import 'package:flutter/material.dart';

class totalpayins extends StatefulWidget {
  const totalpayins({super.key});

  @override
  State<totalpayins> createState() => _totalpayinsState();
}

class _totalpayinsState extends State<totalpayins> {
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.white70,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colors.grey.withOpacity(.3),
          width: 1,
        ),
      ),
      child: SizedBox(
        height: screenheight / 8,
        width: screenwidth / 8,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "TOTAL PAYINS",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "KES 2000.00",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////
///

class totalbalance extends StatefulWidget {
  const totalbalance({super.key});

  @override
  State<totalbalance> createState() => _totalbalanceState();
}

class _totalbalanceState extends State<totalbalance> {
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.white70,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colors.grey.withOpacity(.3),
          width: 1,
        ),
      ),
      child: SizedBox(
        height: screenheight / 8,
        width: screenwidth / 8,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "TOTAL BALANCE",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "KES 2000.00",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//////////////////////////////////////////////////////////////////////////////

class totalpayouts extends StatefulWidget {
  const totalpayouts({super.key});

  @override
  State<totalpayouts> createState() => _totalpayoutsState();
}

class _totalpayoutsState extends State<totalpayouts> {
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.white70,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colors.grey.withOpacity(.3),
          width: 1,
        ),
      ),
      child: SizedBox(
        height: screenheight / 8,
        width: screenwidth / 8,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "TOTAL PAYOUTS",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "KES 2000.00",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
///////////////////////////////////////////////////////////////////////////

class tototalincome_transactions extends StatefulWidget {
  const tototalincome_transactions({super.key});

  @override
  State<tototalincome_transactions> createState() =>
      _tototalincome_transactionsState();
}

class _tototalincome_transactionsState
    extends State<tototalincome_transactions> {
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.white70,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colors.grey.withOpacity(.3),
          width: 1,
        ),
      ),
      child: SizedBox(
        height: screenheight / 8,
        width: screenwidth / 8,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "TOTAL INCOME \nTRANSACTION",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "KES 2000.00",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////

class totalwidthdrawal extends StatefulWidget {
  const totalwidthdrawal({super.key});

  @override
  State<totalwidthdrawal> createState() => _totalwidthdrawalState();
}

class _totalwidthdrawalState extends State<totalwidthdrawal> {
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Card(color: Colors.white70,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colors.grey.withOpacity(.3),
          width: 1,
        ),
      ),
      child: SizedBox(
        height: screenheight / 8,
        width: screenwidth / 6.5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "TOTAL WITHDRAWAL",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "KES 2000.00",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
