Return-Path: <gregkh@linuxfoundation.org>
Return-path: <gregkh@linuxfoundation.org>
Date: Mon, 28 Aug 2017 17:23:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: zbr@ioremap.net, linux-kernel@vger.kernel.org, linux@roeck-us.net,
	jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH linux v5 1/3] drivers: w1: add hwmon support structures
Message-ID: <20170828152318.GA13662@kroah.com>
References: <20170717230906.4084-1-jaghu@google.com>
 <20170717230906.4084-2-jaghu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170717230906.4084-2-jaghu@google.com>
List-ID: <linux-hwmon@vger.kernel.org>

On Mon, Jul 17, 2017 at 04:09:04PM -0700, Jaghathiswari Rankappagounder Natarajan wrote:
> This patch has changes to w1.h/w1.c/w1_family.h generic files to
> add (optional) hwmon support structures.
> 
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> Acked-by: Evgeniy Polyakov <zbr@ioremap.net>
> Acked-by: Guenter Roeck <linux@roeck-us.net>

This patch series doesn't apply against my char-misc git tree at all
(use the char-misc-next branch).  Can you please rebase it and resend?

thanks,

greg k-h
