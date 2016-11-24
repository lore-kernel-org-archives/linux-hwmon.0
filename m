Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:55495 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966349AbcKXPd6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Nov 2016 10:33:58 -0500
Subject: Re: Configure Hardware before read sensor
To: Lucas Tanure <tanure@linux.com>, linux-hwmon@vger.kernel.org
References: <CAJX_Q+0hCFZAg4F2pf0sJ9WZKcQfBSruGxz4jLnX5SzLJvATqA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5b587fd0-04b0-b8ad-b3ae-1a9cfdbd9b93@roeck-us.net>
Date: Thu, 24 Nov 2016 07:33:55 -0800
MIME-Version: 1.0
In-Reply-To: <CAJX_Q+0hCFZAg4F2pf0sJ9WZKcQfBSruGxz4jLnX5SzLJvATqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/24/2016 06:44 AM, Lucas Tanure wrote:
> Hi,
>
> My hardware needs to be configured before I can read the temperature sensor.
> Like, my hardware can make 0-1023 samples per measure, more samples
> more accurate, but takes longer times.
> Where I can put a sysfs atribute to configure my hardware ? There is
> no  temp[1-*]_configure or chip_configure.
>
Chips are expected to be configured by the BIOS, ROMMON, or through devicetree data,
not through sysfs. Drivers sometimes have an "update_interval" attribute which may
affect, for example, the number of samples taken or the number of bits reported.

Unfortunately, since you did not tell us what chip you are talking about, it is a
bit difficult to give advice (like asking where to find the emergency brake on your
car without telling the make and model).

Guenter

