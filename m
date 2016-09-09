Return-path: <hotran@apm.com>
MIME-Version: 1.0
In-Reply-To: <6198994.YhDCC7xNAM@wuerfel>
References: <1469134557-26869-1-git-send-email-hotran@apm.com>
 <2852054.37zytD0HIa@wuerfel> <CAFHUOYyGf0MFtDrYaAMSRjZ5hJ4yxV6wSa3BpGF73tyC6GQBxw@mail.gmail.com>
 <6198994.YhDCC7xNAM@wuerfel>
From: Hoan Tran <hotran@apm.com>
Date: Fri, 9 Sep 2016 13:51:28 -0700
Message-ID: <CAFHUOYxY8VDr0RJkWZ3LQJNM8hfefNooOExOHvcy7Nj4Av5aEg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: xgene: access mailbox as RAM
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, Jean Delvare <jdelvare@suse.com>,
	Ashwin Chaugule <ashwin.chaugule@linaro.org>, Duc Dang <dhdang@apm.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, linux-doc@vger.kernel.org,
	lkml <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Loc Ho <lho@apm.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, Sep 9, 2016 at 1:50 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Friday, September 9, 2016 1:43:17 PM CEST Hoan Tran wrote:
>>
>> > * Are you sure you don't need any smp_rmb()/smp_wmb() barriers
>> > between the accesses?
>>
>> No, we don't need a strict read/write during access PCC subspace. Just
>> make sure all access is committed before PCC send message to the
>> platform which done by PCC mailbox driver.
>>
>
> Ok, got it. The PCC mailbox driver presumably uses writel() to
> send the message, and that implies the necessary barrier
> (unlike writel_relaxed), right?

Yes,

Hoan
>
>         Arnd
>
