# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: juandrie <juandrie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/08 12:05:06 by julietteand       #+#    #+#              #
#    Updated: 2023/06/19 17:51:58 by juandrie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

CC = gcc

CFLAGS = -Wall -Wextra -Werror

LIBFT_DIR = Libft

HEADER = -I$(LIBFT_DIR)

DEF_COLOR	=	\033[0;39m
ORANGE		=	\033[0;33m
GRAY		=	\033[0;90m
RED			=	\033[0;91m
GREEN		=	\033[1;92m
YELLOW		=	\033[1;93m
BLUE		=	\033[0;94m
MAGENTA		=	\033[0;95m
CYAN		=	\033[0;96m
WHITE		=	\033[0;97m

$(NAME): libft server client bonus

all: $(NAME)

libft:
	$(MAKE) -C $(LIBFT_DIR)
	@cp $(LIBFT_DIR)/libft.a .

client: client.o 
	$(CC) $(CFLAGS) client.o -L$(LIBFT_DIR) -lft -o $@

server: server.o 
	$(CC) $(CFLAGS) server.o -L$(LIBFT_DIR) -lft -o $@

bonus : libft server_bonus client_bonus

server_bonus: server_bonus.o 
	$(CC) $(CFLAGS) server_bonus.o -L$(LIBFT_DIR) -lft -o $@

client_bonus: client_bonus.o 
	$(CC) $(CFLAGS) client_bonus.o -L$(LIBFT_DIR) -lft -o $@

%.o: %.c
	$(CC) $(CFLAGS) $(HEADER) -c $< -o $@	

clean:
	rm -f client.o server.o server_bonus.o client_bonus.o

fclean: clean
	rm -f client server server_bonus client_bonus libft.a
	$(MAKE) -C $(LIBFT_DIR) fclean

re: fclean all

.PHONY: all clean fclean re libft
