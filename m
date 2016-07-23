Return-path: <itaru.kitayama@riken.jp>
To: Hoan Tran <hotran@apm.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Ashwin Chaugule <ashwin.chaugule@linaro.org>, Duc Dang <dhdang@apm.com>,
 lho@apm.com, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
From: Itaru Kitayama <itaru.kitayama@riken.jp>
Subject: hwmon: xgene: Add support for X-Gene hwmon driver
Message-ID: <02814a96-c620-c4af-e278-40432f6f701f@riken.jp>
Date: Sun, 24 Jul 2016 08:51:57 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi Hoan,

I've been testing your patch set on a Rev B0 system with ACPI, in dmesg
I see:

[    1.546444] xgene-slimpro-i2c APMC0D40:00: i2c mailbox channel 
request failed
[    1.570062] xgene-slimpro-hwmon APMC0D29:00: no pcc-channel property

what other packages or subsystems do we need to make this work on 
ACPI-based systems?

Itaru
