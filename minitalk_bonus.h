/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minitalk_bonus.h                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: juandrie <juandrie@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/06/07 19:58:22 by julietteand       #+#    #+#             */
/*   Updated: 2023/06/19 15:57:42 by juandrie         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef MINITALK_BONUS_H
# define MINITALK_BONUS_H

# include <sys/types.h>
# include <signal.h>
# include <unistd.h>
# include <stdio.h>
# include "Libft/libft.h"
# include "Libft/ft_printf.h"

void	ft_send_bits_bonus(int pid, char i);
void	ft_handler(int signal, siginfo_t *info, void *context);
void	ft_send_string_bonus(int pid, const char *str);

#endif