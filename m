Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58359 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933727AbeFLWMU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Jun 2018 18:12:20 -0400
Date: Tue, 12 Jun 2018 15:12:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Menzel <pmenzel+linux-hwmon@molgen.mpg.de>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: nct6775: UBSAN: shift exponent 32 is too large for 32-bit type
 'long unsigned int'
Message-ID: <20180612221218.GA15406@roeck-us.net>
References: <d02001e2-fa4c-6a2e-cc50-a8d9a8146d57@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d02001e2-fa4c-6a2e-cc50-a8d9a8146d57@molgen.mpg.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Paul,

On Tue, Jun 12, 2018 at 11:50:45PM +0200, Paul Menzel wrote:
> Dear Guenther, dear Jean,
> 
> 
> Building Linux with the undefined behavior sanitizer (UBSAN), loading the
> module *nct6775* on the ASRock E350M1 shows the error below.
> 
> ```
> [   28.322775] UBSAN: Undefined behaviour in drivers/hwmon/nct6775.c:4179:27
> [   28.322833] shift exponent 32 is too large for 32-bit type 'long unsigned
> int'
> ```
> 
> I believe this was introduced by commit cc66b3038254 (hwmon: (nct6775)
> Rework temperature source and label handling), but the same issue was
> already present before.
> 

I don't think so. The code used to be
	for (i = 0; i < data->temp_label_num - 1; i++) {
Notice the "- 1". So it should be
	for (i = 0; i < 31; i++) {

In practice it doesn't matter because "data->temp_mask & BIT(31 + 1)"
will always be false, causing the last loop iteration to abort, but
it is nevertheless wrong.

Thanks a lot for the report. I'll prepare a patch.

Guenter

> ```
> -       for (i = 0; i < data->temp_label_num - 1; i++) {
> +       for (i = 0; i < 32; i++) {
> +               if (!(data->temp_mask & BIT(i + 1)))
> +                       continue;
> ```
> 
> `include/linux/bitops.h` has the macros below.
> 
> ```
> #define BIT(nr)                 (1UL << (nr))
> #define BIT_ULL(nr)             (1ULL << (nr))
> ```
> 
> Maybe `BIT_ULL` should be used, but I do not know, if that’d would work with
> `data->temp_mask`, which has type `u32`.
> 
> 
> Kind regards,
> 
> Paul
