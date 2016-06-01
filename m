Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:43476 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751130AbcFASK7 (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Jun 2016 14:10:59 -0400
Date: Wed, 1 Jun 2016 11:10:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hoan Tran <hotran@apm.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Ashwin Chaugule <ashwin.chaugule@linaro.org>,
	Duc Dang <dhdang@apm.com>, Loc Ho <lho@apm.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	lkml <linux-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [2/3] hwmon: xgene: Adds hwmon driver
Message-ID: <20160601181049.GA10954@roeck-us.net>
References: <1463415447-29903-3-git-send-email-hotran@apm.com>
 <20160530052507.GA25641@roeck-us.net>
 <CAFHUOYzWj_PbbpzCW5CjO7d3uc7x2h8UvHrYmDoKyttNQVDDZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFHUOYzWj_PbbpzCW5CjO7d3uc7x2h8UvHrYmDoKyttNQVDDZA@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, May 31, 2016 at 11:00:05PM -0700, Hoan Tran wrote:
> Hi Guenter,
> 
> >
> > Overall, I have to say that the code is quite complex due to the repeated
> > checks for ACPI. I am close to suggest having two separate drivers,
> > one for ACPI and one for non-ACPI. Any chance to separate ACPI vs. non-ACPI
> > code a bit better ?
> 
> How about create separate rx_cb functions for ACPI and non-ACPI ?

Yes, that would be great if it is possible.

> As almost functions are the same between ACPI and non-ACPI, I thought
> keep the same driver is still OK, isn't it ?
> 
If you can separate the ACPI code from the non-ACPI code a bit better than
right now, yes.

Thanks,
Guenter
