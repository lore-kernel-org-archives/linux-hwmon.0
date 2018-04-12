Return-Path: <jae.hyun.yoo@linux.intel.com>
Return-path: <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH v3 05/10] ARM: dts: aspeed: peci: Add PECI node
To: Joel Stanley <joel@jms.id.au>
Cc: Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andriy.shevchenko@intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Fengguang Wu <fengguang.wu@intel.com>, Greg KH <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Haiyue Wang
 <haiyue.wang@linux.intel.com>, James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Jean Delvare <jdelvare@suse.com>, Julia Cartwright <juliac@eso.teric.us>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Milton Miller II <miltonm@us.ibm.com>, Pavel Machek <pavel@ucw.cz>,
 Randy Dunlap <rdunlap@infradead.org>,
 Stef van Os <stef.van.os@prodrive-technologies.com>,
 Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
 linux-hwmon@vger.kernel.org, Linux ARM
 <linux-arm-kernel@lists.infradead.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-6-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xf7ta43K=POx8J6bAdjvX=wCzy-+HWqHsm+RstQxeetCQ@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <64dae4bb-8049-a09d-d0bb-18f6ec52ea63@linux.intel.com>
Date: Wed, 11 Apr 2018 19:20:28 -0700
MIME-Version: 1.0
In-Reply-To: <CACPK8Xf7ta43K=POx8J6bAdjvX=wCzy-+HWqHsm+RstQxeetCQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On 4/11/2018 4:52 AM, Joel Stanley wrote:
> On 11 April 2018 at 04:02, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>> This commit adds PECI bus/adapter node of AST24xx/AST25xx into
>> aspeed-g4 and aspeed-g5.
>>
> 
> The patches to the device trees get merged by the ASPEED maintainer
> (me). Once you have the bindings reviewed you can send the patches to
> me and the linux-aspeed list (I've got a pending patch to maintainers
> that will ensure get_maintainers.pl does the right thing as far as
> email addresses go).
> 
> I'd suggest dropping it from your series and re-sending once the
> bindings and driver are reviewed.
> 
> Cheers,
> 
> Joel
> 

Do you mean that bindings and driver of ASPEED peci adapter driver 
including documents?

Thanks,
-Jae
