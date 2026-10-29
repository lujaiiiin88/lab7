:- dynamic basket/1.

basket([coffee, milk, chocolate, apple, juice]).

start :-
    disp_menu.

disp_menu :-
    nl,
    write('************************************'), nl,
    write('*           SHOPPING LIST          *'), nl,
    write('************************************'), nl,
    write('d. Display all items.'), nl,
    write('a. Add an item to the list.'), nl,
    write('e. Exit.'), nl,
    write('------------------------------------'), nl,
    write('ENTER YOUR CHOICE: '),
    read(Choice),
    handle_choice(Choice).

handle_choice(d) :-
    basket(Items),
    nl, write('--- Current Basket Items ---'), nl,
    display_list(Items),
    disp_menu.

handle_choice(a) :-
    nl, write('Enter the item you want to add: '),
    read(NewItem),
    basket(OldItems),
    add_at_the_end(NewItem, OldItems, UpdatedItems),
    retract(basket(OldItems)),
    assertz(basket(UpdatedItems)),
    write('The item has been added successfully.'), nl,
    disp_menu.

handle_choice(e) :-
    nl, write('Exiting shopping program. Goodbye!'), nl, !.

handle_choice(_) :-
    nl, write('Invalid choice, please try again.'), nl,
    disp_menu.

display_list([]) :- !.
display_list([Head|Tail]) :-
    write('- '), write(Head), nl,
    display_list(Tail).

add_at_the_end(X, [], [X]).
add_at_the_end(X, [Head|Tail], [Head|Result]) :-
    add_at_the_end(X, Tail, Result).