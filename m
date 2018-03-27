Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <1522136107.12357.58.camel@perches.com>
Subject: Re: [PATCH script] hwmon: Use octal not symbolic permissions
From: Joe Perches <joe@perches.com>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        patches@opensource.cirrus.com
Date: Tue, 27 Mar 2018 00:35:07 -0700
In-Reply-To: <9b112651-d0cf-5f3b-b643-3328028a95cd@roeck-us.net>
References: <1522096136.12357.21.camel@perches.com>
         <9b112651-d0cf-5f3b-b643-3328028a95cd@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-Archive: <https://lore.kernel.org/lkml/>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-ID: <linux-hwmon@vger.kernel.org>

On Mon, 2018-03-26 at 23:33 -0700, Guenter Roeck wrote:
> Since the hwmon subsystem has been labeled as both "obsolete" and "obscure",

fyi: It's marked Maintained in MAINTAINERS

HARDWARE MONITORING
M:	Jean Delvare <jdelvare@suse.com>
M:	Guenter Roeck <linux@roeck-us.net>
L:	linux-hwmon@vger.kernel.org
W:	http://hwmon.wiki.kernel.org/
T:	git git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
S:	Maintained
F:	Documentation/hwmon/
F:	drivers/hwmon/
F:	include/linux/hwmon*.h
