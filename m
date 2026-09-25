Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E707408602
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 18:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359391; cv=none; b=prNfabgW6iEUndVPUSh7EFmUJSgoUvucKUhd4gfobvv7qIjfgqpuSrprMiFUKd4x0RgOB9CIkbyBu3wBsIFufk9c4Iv9qHY5hNrSNMfqOD+lWyvGSHCY1hE6YT30eiUTvNEvDSB5NgxZg8IMArkxVB3mxjMMP7KuD/zdVwbKT/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359391; c=relaxed/simple;
	bh=Ju7zhvTIV+QCh40+nZMxiWd5uKzk+g1KU9BhArseauI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTRBeysuHGil4J1Lw1wgwYcEaocYnHhKWL0OH5nU8Y93jSZzBNHKx2ECYoWsJuN94tttu8ed7vp8nvLoGRa4+vruXNfGHIjPnFzyVJAdhCIBJhvaArglzfx3ne8vs1SvqiWD12ZnbE5pY3fcLtoIGxlAlyoyloKaEpt0/02siUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pw2hW6Kk; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pw2hW6Kk"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so932408f8f.0
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 11:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790359388; x=1790964188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aL9Wl8C0xRRNjJBTarQpi8R0Mck+qeYOMPSZBKJwmx0=;
        b=Pw2hW6KkB6Wc459qoJzEC6z4sjiqgfdrCUXqVEOoPvkyww3+uz6v0Xz/PmmdMiMK8O
         9ezq3WYhyK5yBW+aAi7r0rLWJF1RIJoOgAnFWmwxxOIme4l3lo0awQBo0TNOq58DYuFU
         2uaM/lwDBVvcVBE+nB1mAGCZa716exkOF5jx2ljsfqmOhDrA6zKwtxCb6SgISRvckIy5
         GjzC0BAxOT8GKZIOCvWo3LcrN+0zNuYBe/QQVwxzpNFx6dVe38Uah53kmGl0ZcIT/DUL
         ML9U4kwiVj37G/xkoNdkAyKNjFyLtyKJXwl8a4MOqfunNXSOI+Wi/UPoR6l/qSeEjxqp
         /g9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790359388; x=1790964188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aL9Wl8C0xRRNjJBTarQpi8R0Mck+qeYOMPSZBKJwmx0=;
        b=eUwmF39nA+UvM3KuK/EyluYnvoY0b4KnpGim+lnx+vIV4D2Gy3FiOfRO5th+4im9Zy
         d/EsNzFW5Y9DQqbN9WyRYeq9oLqaaPEFShG/eI/EqFuXt366BKwnrdt17D1ARoUzc89q
         pKnyv7S2LpQpEDL+IYqqKickwWmronQjGvk9s7/oFP9WiGXNPkj25gDcf6aFzCNRw4Zr
         /aqD0yka0gIX5L/Ez4zoCvdjtkotpFs5RhIvtRStHPIeisXz9ZHXj8kTMLcHyc8ZDW2K
         oZRAeOdfqaXJQHmDSdoSRf4DNKZ8+Ub2VlII/z4lXy//4KNeghoe5uUv2SJT8CbJzpwM
         g6kg==
X-Gm-Message-State: AFuF++mrz6fIo3ypAsvi/IVRnoQxeiI+cdl5AGbUbaMk1UEp0+ajGGGG
	gc/Yvx1QG8pBXeCSqwEsONBsJ7EwIygzHMZd2yuZxWio3bqjAP3175S2
X-Gm-Gg: AYBFou0WzmG6aXEOJCSzow0w3OYTEAiA46MvYGKWLo8Gd37GOFqVy8Uk8fYIB0ViTsJ
	8QASsc7xWoaixRz1FSbd+th975f3lhbGhsfZy9Uy48oP7LgC8IREVFIbIxT97iHaEeIiIFRfJ21
	PaLsxCz0cJjhQ8ME9Y1MWatcRYOvkvh6JhWs5k/MfBsejeLcB2B2zOw7/xI/FegJS/0JRptpX89
	dv9Cuhr1uw4nTW2eRjsR1m78kq2I1IZom78A1FpUSwoSgWpl9QiFf9D/UeU9ZpPaVDeQUI9FLnn
	33lhsSgIDPKcU8j8P6JwvwJ8orGdDCnmZBDUpuUiTULyT0PLxXFJ09czUDFk2JmZjG28+B2iGS7
	yjoeB76KP36XRZmf6+aSSsb+QXtFicj3LYlEzdRHLTJ3LqRx1rTE8KXsgiHu93zWfwNB5QMlOXG
	ZN8x1eZJWjV7W6CrvKklIvc9uta+6VSqudtJABwt8QVyyyKeucNtwu9LE0Lx/FjbFwJypyPkqfi
	kXNAbx07p6nlJ7kkNU9ErLGWgm+UqZNMXPpSqFMwCmw5cFXf9dYsaexC9d76m5U+W3eYJEghreh
	yJjCwFCf4b5keQ==
X-Received: by 2002:a05:6000:41d9:b0:488:834a:cbb with SMTP id ffacd0b85a97d-488834a1dd1mr3121424f8f.2.1790359387972;
        Fri, 25 Sep 2026 11:03:07 -0700 (PDT)
Received: from shift.daheim (p200300d5ff3cee0050f496fffe46beef.dip0.t-ipconnect.de. [2003:d5:ff3c:ee00:50f4:96ff:fe46:beef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6450a3sm7929304f8f.25.2026.09.25.11.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:03:07 -0700 (PDT)
Received: from localhost ([127.0.0.1])
	by shift with esmtp (Exim 4.100.1)
	(envelope-from <chunkeey@gmail.com>)
	id 1xAAGI-00000000LZj-2fxl;
	Fri, 25 Sep 2026 20:03:06 +0200
Message-ID: <f28a5470-0d9e-4045-9c64-5614e0e88de2@gmail.com>
Date: Fri, 25 Sep 2026 20:03:06 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (lm70) Fix rounding of negative temperatures
To: Ridham Khurana <khurana.ridham222@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christian Lamparter <chunkeey@googlemail.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>, Shuah Khan <shuah@kernel.org>,
 Jori Koolstra <jkoolstra@xs4all.nl>,
 Brigham Campbell <me@brighamcampbell.com>,
 linux-kernel-mentees@lists.linux.dev
References: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
Content-Language: de-DE
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 9/24/26 10:53 PM, Ridham Khurana wrote:
> temp1_input_show() drops the low bits of the temperature register by
> dividing the raw value (raw / 32 on the LM70). These bits are not part
> of the temperature: the LM70, LM71, LM74 and TMP122/TMP124 always
> return some of them as 1, and the TMP125 fills them with copies of the
> temperature LSB. Division rounds toward zero, so a negative temperature
> with any of these bits set is reported one LSB too high.
> 
> For example, the TMP122 returns 0xffff for -0.0625 degrees C, which the
> driver reports as 0. The LM70 returns 0xf39f for -25 degrees C, which
> the driver reports as -24750.
> 
> Use an arithmetic right shift instead, which drops the low bits and
> rounds down. tmp421 had a similar problem with negative values, fixed
> by commit 724e8af85854 ("hwmon: (tmp421) fix rounding for negative
> values").

For the TMP125 yes:

Reviewed-by: Christian Lamparter <chunkeey@gmail.com>


> Fixes: e1a8e913f97e ("[PATCH] lm70: New hardware monitoring driver")
> Fixes: a86e94dc946d ("hwmon: (lm70) Add support for LM71 and LM74")
> Fixes: cd929672a9ef ("hwmon: (lm70) Add ti,tmp125 support")
> Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
> ----
I wrote a little test program by hand (see below) and ran it on x64.
No idea if different archs behave differently or if
a clever unsafe math optimizing compiler flag will
convert the  "/ 32" to a " >> 5" but I doubt that...

---
tmp125: raw:7ec0 tmp125_proposed: -2500 tmp125_now: -2500
tmp125: raw:7eff tmp125_proposed: -2250 tmp125_now: -2000  <--- loss of percision
tmp125: raw:7f00 tmp125_proposed: -2000 tmp125_now: -2000
tmp125: raw:7f3f tmp125_proposed: -1750 tmp125_now: -1500  <--- more
tmp125: raw:7f40 tmp125_proposed: -1500 tmp125_now: -1500
tmp125: raw:7f7f tmp125_proposed: -1250 tmp125_now: -1000  <--- and this
tmp125: raw:7f80 tmp125_proposed: -1000 tmp125_now: -1000
tmp125: raw:7fbf tmp125_proposed:  -750 tmp125_now:  -500  <--- also bad
tmp125: raw:7fc0 tmp125_proposed:  -500 tmp125_now:  -500
tmp125: raw:7fff tmp125_proposed:  -250 tmp125_now:     0  <--- ouch
tmp125: raw:   0 tmp125_proposed:     0 tmp125_now:     0
tmp125: raw:  3f tmp125_proposed:   250 tmp125_now:   250
tmp125: raw:  40 tmp125_proposed:   500 tmp125_now:   500
tmp125: raw:  7f tmp125_proposed:   750 tmp125_now:   750
tmp125: raw:  80 tmp125_proposed:  1000 tmp125_now:  1000
tmp125: raw:  bf tmp125_proposed:  1250 tmp125_now:  1250
tmp125: raw:  c0 tmp125_proposed:  1500 tmp125_now:  1500
tmp125: raw:  ff tmp125_proposed:  1750 tmp125_now:  1750
tmp125: raw: 100 tmp125_proposed:  2000 tmp125_now:  2000
tmp125: raw: 13f tmp125_proposed:  2250 tmp125_now:  2250
tmp125: raw: 140 tmp125_proposed:  2500 tmp125_now:  2500

(the positive values all look good.)

--- SNIP test.c program

#just name the file test.c and run make test (in a directory without any other makefile)
#include <stdio.h>
#include <asm-generic/int-l64.h>

static __s32 sign_extend32(__u32 value, int index)
{
         __u8 shift = 31 - index;
         return (__s32)(value << shift) >> shift;
}

static int tmp125_now(__s16 raw)
{
         return (sign_extend32(raw, 14) / 32) * 250;

}

static int tmp125_proposed(__s16 raw)
{
         return (sign_extend32(raw, 14) >> 5) * 250;

}

int main(int argc, char **args)
{
         for (__s16 raw = -320; raw <= 320; raw+=32) {
                 __s16 tmp=raw & 0x7fe0 | ((raw & 32) >> 1) | ((raw & 32) >> 2) | ((raw & 32) >> 3) | ((raw & 32) >> 4) | ((raw & 32) >> 5);
                 printf("tmp125: raw:%4x tmp125_proposed:%6d tmp125_now:%6d\n", tmp, tmp125_proposed(tmp), tmp125_now(tmp));
         }

         return 0;
}

--- SNAP

FYI: TMP125 datasheet says:
"The  Temperature  Register  of  the  TMP125  is  a  16-bit, read-only register that stores
the output of the most recentconversion. However, temperature is represented by only10-bits,
which are in signed two’s complement format. Thefirst bit of the Temperature Register, D15,
is a leading zero. Bits D14 and [sic] D5 are used to indicate temperature. Bits D4 to D0
are the same as D5 (see Table 1)."

(They probably meant Bits D14 >>to<< D5 are used to indicate temperature).
