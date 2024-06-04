import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/screens/home/blocs/get_pizza_bloc/get_pizza_bloc.dart';
import 'details_screen.dart';
import '../../auth/blocs/sign_in_bloc/sign_in_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          children: [
            Image.asset(
              'assets/8.png',
              scale: 15,
            ),
            const SizedBox(width: 10),
            const Text(
              'MyPizza',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
          IconButton(
              onPressed: () {
                context.read<SignInBloc>().add(SignOutRequired());
              },
              icon: const Icon(Icons.logout_sharp))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<GetPizzaBloc, GetPizzaState>(
          builder: (context, state) {
            if (state is GetPizzaSuccess) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 9 / 16),
                  itemCount: state.pizzas.length,
                  itemBuilder: (context, int i) {
                    return Material(
                      elevation: 3,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    DetailsScreen(state.pizzas[i]),
                              ));
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(state.pizzas[i].picture),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: state.pizzas[i].isVeg
                                              ? Colors.green
                                              : Colors.red.shade300,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        child: Text(
                                          state.pizzas[i].isVeg
                                              ? 'Veg'
                                              : 'Non-Veg',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.green.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        child: Text(
                                          state.pizzas[i].spiceLevel == 1
                                              ? '🌶️ Bland'
                                              : state.pizzas[i].spiceLevel == 2
                                                  ? '🌶️🌶️ Balanced'
                                                  : '🌶️🌶️🌶️ Spicy',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  state.pizzas[i].spiceLevel ==
                                                          1
                                                      ? Colors.green
                                                      : state.pizzas[i]
                                                                  .spiceLevel ==
                                                              2
                                                          ? Colors.orange
                                                          : Colors.redAccent,
                                              fontSize: 10),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  state.pizzas[i].name,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  state.pizzas[i].description,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey.shade700),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '\$${(state.pizzas[i].price - (state.pizzas[i].price * (state.pizzas[i].discount) / 100)).toStringAsFixed(2)}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            '\$${state.pizzas[i].price}.00',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.grey.shade500),
                                          ),
                                        ],
                                      ),
                                      const IconButton(
                                          onPressed: null,
                                          icon: Icon(Icons.add))
                                    ],
                                  ))
                            ]),
                      ),
                    );
                  });
            } else if (state is GetPizzaLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text('An Error Has Occured...!'));
            }
          },
        ),
      ),
    );
  }
}
