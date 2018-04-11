Return-Path: <joel.stan@gmail.com>
Return-path: <joel.stan@gmail.com>
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <20180410183212.16787-6-jae.hyun.yoo@linux.intel.com>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com> <20180410183212.16787-6-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Apr 2018 21:22:30 +0930
Message-ID: <CACPK8Xf7ta43K=POx8J6bAdjvX=wCzy-+HWqHsm+RstQxeetCQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] ARM: dts: aspeed: peci: Add PECI node
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>, Andrew Lunn <andrew@lunn.ch>,
	Andy Shevchenko <andriy.shevchenko@intel.com>, Arnd Bergmann <arnd@arndb.de>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Fengguang Wu <fengguang.wu@intel.com>,
	Greg KH <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>,
	Haiyue Wang <haiyue.wang@linux.intel.com>, James Feist <james.feist@linux.intel.com>,
	Jason M Biils <jason.m.bills@linux.intel.com>, Jean Delvare <jdelvare@suse.com>,
	Julia Cartwright <juliac@eso.teric.us>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Milton Miller II <miltonm@us.ibm.com>, Pavel Machek <pavel@ucw.cz>, Randy Dunlap <rdunlap@infradead.org>,
	Stef van Os <stef.van.os@prodrive-technologies.com>,
	Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>, Vernon Mauery <vernon.mauery@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
	devicetree <devicetree@vger.kernel.org>, linux-hwmon@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On 11 April 2018 at 04:02, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> This commit adds PECI bus/adapter node of AST24xx/AST25xx into
> aspeed-g4 and aspeed-g5.
>

The patches to the device trees get merged by the ASPEED maintainer
(me). Once you have the bindings reviewed you can send the patches to
me and the linux-aspeed list (I've got a pending patch to maintainers
that will ensure get_maintainers.pl does the right thing as far as
email addresses go).

I'd suggest dropping it from your series and re-sending once the
bindings and driver are reviewed.

Cheers,

Joel
