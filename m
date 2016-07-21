Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-vk0-f44.google.com ([209.85.213.44]:33510 "EHLO
	mail-vk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754174AbcGUWVM (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Thu, 21 Jul 2016 18:21:12 -0400
Received: by mail-vk0-f44.google.com with SMTP id x130so133731801vkc.0
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Jul 2016 15:21:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160721220935.GB19236@roeck-us.net>
References: <1469134557-26869-1-git-send-email-hotran@apm.com>
 <1469134557-26869-3-git-send-email-hotran@apm.com> <20160721220935.GB19236@roeck-us.net>
From: Hoan Tran <hotran@apm.com>
Date: Thu, 21 Jul 2016 15:21:11 -0700
Message-ID: <CAFHUOYzi48QkAp+Uw9yRSvcCrNPR5LKczDfb9r5t0fqZ0qVcFw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] hwmon: xgene: Add hwmon driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Ashwin Chaugule <ashwin.chaugule@linaro.org>,
	Duc Dang <dhdang@apm.com>, Loc Ho <lho@apm.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	lkml <linux-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Devicetree List <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Guenter,

On Thu, Jul 21, 2016 at 3:09 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Thu, Jul 21, 2016 at 01:55:56PM -0700, Hoan Tran wrote:
>> This patch adds hardware temperature and power reading support for
>> APM X-Gene SoC using the mailbox communication interface.
>>
>> Signed-off-by: Hoan Tran <hotran@apm.com>
>> ---
>
> [ ... ]
>
>> +
>> +     dev_info(&pdev->dev, "APM X-Gene SoC HW monitor driver registered\n");
>> +
>> +     return rc;
>> +
>
> Nitpick: rc == 0 here, so return 0; is a better choice.
> Otherwise looks good.

Yes, I'll fix it then send v4 shortly.

>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>
> Note that I can not apply the patch at this time due to its dependency.

Thanks ! I'll let you know when Rafael applies that dependent patch
into linux-next.

Thanks
Hoan

>
> Guenter
