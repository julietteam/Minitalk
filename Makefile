# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: juandrie <juandrie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/08 12:05:06 by julietteand       #+#    #+#              #
#    Updated: 2023/06/19 13:00:34 by juandrie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := libft.a

CC := gcc

CFLAGS := -Wall -Wextra -Werror -I./Libft 

LIBFT_DIR := Libft

HEADER := -I$(LIBFT_DIR)

$(NAME): all


all: libft server client server_bonus client_bonus 

libft:
	$(MAKE) -C $(LIBFT_DIR)
	@cp $(LIBFT_DIR)/libft.a .

client: client.o libft.a
	$(CC) $(CFLAGS) client.o -L$(LIBFT_DIR) -lft -o $@

server: server.o libft.a
	$(CC) $(CFLAGS) server.o -L$(LIBFT_DIR) -lft -o $@

server_bonus: server_bonus.o libft.a
	$(CC) $(CFLAGS) server_bonus.o -L$(LIBFT_DIR) -lft -o $@

client_bonus: client_bonus.o libft.a
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
