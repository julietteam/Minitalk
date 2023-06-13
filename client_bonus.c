/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: julietteandrieux <julietteandrieux@stud    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/06/07 19:57:47 by julietteand       #+#    #+#             */
/*   Updated: 2023/06/13 09:37:19 by julietteand      ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk_bonus.h"

int	g_confirmation_received = 0;

void	ft_confirm(int signal)
{
	if (!g_confirmation_received)
	{
		if (signal == SIGUSR1)
			ft_printf("\033[0;32mCONFIRMATION\033[0;32m\n");
		g_confirmation_received = 1;
	}
}

void	ft_send_bits_bonus(int pid, char i)
{
	int	bit;

	bit = 0;
	while (bit < 8)
	{
		if ((i & (0x01 << bit)) != 0)
			kill(pid, SIGUSR1);
		else
			kill(pid, SIGUSR2);
		usleep(100);
		bit++;
	}
}

void	ft_send_string_bonus(int pid, const char *str)
{
	while (*str)
	{
		ft_send_bits_bonus(pid, *str);
		str++;
	}
	ft_send_bits_bonus(pid, '\n');
}

int	main(int argc, char **argv)
{
	int	pid;

	if (argc == 3)
	{
		pid = ft_atoi(argv[1]);
		signal(SIGUSR1, ft_confirm);
		signal(SIGUSR2, ft_confirm);
		ft_send_string_bonus(pid, argv[2]);
	}
	else
	{
		ft_printf("\033[91mError: wrong format.\033[0m\n");
		ft_printf("\033[33mTry: ./client_bonus [PID] [MESSAGE]\033[0m\n");
		return (1);
	}
	return (0);
}
