# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dbubnov <dbubnov@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/06/21 12:03:47 by dbubnov           #+#    #+#              #
#    Updated: 2019/08/01 15:12:48 by dbubnov          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME=libftprintf.a
SRCS=src/*.c
OBJECTS=*.o
INCLUDES=src/
FLAGS=-Werror -Wextra -Wall
all: $(NAME)
$(NAME):
	@make -C libft/ re
	gcc $(FLAGS) -I$(INCLUDES) -c $(SRCS)
	ar -rc $(NAME) $(OBJECTS) libft/*.o
	ranlib $(NAME)
clean:
	@make -C libft/ clean
	/bin/rm -f $(OBJECTS)
fclean: clean
	@make -C libft/ fclean
	/bin/rm -f $(NAME)
re: fclean all

#---------------------------------------------------------

run:
	gcc $(FLAGS) ./libft/libft.a ./src/*.c
	./a.out
debug:
	gcc -g $(FLAGS) ./libft/libft.a ./src/*.c
dclean:
	@make -C ./libft/ clean
	rm -Rf a.out.dSYM
	rm *.o
	rm a.out
