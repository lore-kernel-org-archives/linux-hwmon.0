Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:33969 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755618AbcKVRK5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Nov 2016 12:10:57 -0500
Received: by mail-qt0-f195.google.com with SMTP id l20so3338171qta.1
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Nov 2016 09:10:57 -0800 (PST)
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com. [209.85.220.182])
        by smtp.gmail.com with ESMTPSA id 33sm14193840qtq.1.2016.11.22.09.10.55
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Nov 2016 09:10:55 -0800 (PST)
Received: by mail-qk0-f182.google.com with SMTP id n204so34160115qke.2
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Nov 2016 09:10:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAJX_Q+1iPpLnbLYB6=9gWR2EEwek5VvioBCZB6gYsChOZ3EyVA@mail.gmail.com>
References: <CAJX_Q+1iPpLnbLYB6=9gWR2EEwek5VvioBCZB6gYsChOZ3EyVA@mail.gmail.com>
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 22 Nov 2016 17:10:54 +0000
Message-ID: <CAJX_Q+0bDQmHYpfkK3RGTmWdJoi0RAB+u=5M9WtgyoKdeGXdrQ@mail.gmail.com>
Subject: Re: IEEE-754 Float to int
To: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi,

My hardware gives me the board temperature as a float 32bits.
So, at some point my hardware gives me a 32bit IEEE-754 float, like this :

regmap_read(device->regmap, ADDR0, &temp);
value = temp << 16;
regmap_read(device->regmap, ADDR1, &temp);
value |= temp;

So, value has a 32bit float now, and I would like to print over hwmon
sysfs API. Like :

temp
Current temperature as reported by thermal zone (sensor).
Unit: millidegree Celsius
RO, Required


Read 26.92387 --> Read 26923 at /sys/class/hwmon/hwmon0/temp0_input
Simple, no float operations.

How I can do it ?

Thanks!

--
Lucas Tanure
