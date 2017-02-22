Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from ms2.toshiba-tops.co.jp ([61.200.21.4]:55969 "EHLO
        dmz-ms2.toshiba-tops.co.jp" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752717AbdBVE1r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Feb 2017 23:27:47 -0500
Date: Wed, 22 Feb 2017 13:26:45 +0900
Message-ID: <20170222.132645.1984349236836667063.nemoto@toshiba-tops.co.jp>
To: <linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <jdelvare@suse.com>,
        <sato@toshiba-tops.co.jp>
Subject: Re: [PATCH] hwmon: (w83627ehf) Use request_muxed_region
From: Atsushi Nemoto <nemoto@toshiba-tops.co.jp>
In-Reply-To: <20170221154258.GA14606@roeck-us.net>
References: <20170220.135014.415950098927632727.nemoto@toshiba-tops.co.jp>
        <20170221154258.GA14606@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, 21 Feb 2017 07:42:58 -0800, Guenter Roeck <linux@roeck-us.net> wrote:
>> -	superio_enter(sio_data->sioreg);
>> +	if (superio_enter(sio_data->sioreg)) {
>> +		pr_err("%s: superio is busy!!\n", __func__);
>> +		return;
>> +	}
> 
> This is not good. It effectively ignores the error and does not
> initialize the chip's fan configuration. Displaying a log message
> doesn't improve the situation.
> 
> The best solution here would probably be to remove superio_enter/exit
> from this function and move the superio_exit() call in the calling code
> after the call to w83627ehf_check_fan_inputs().

Thank you. I agree with your solution. I will post an updated patch.

---
Atsushi Nemoto


