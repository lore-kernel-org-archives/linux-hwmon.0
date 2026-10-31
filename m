Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793473895;
	b=5W9KcTDpbfIvqiNSTYn2BouAi70p9NHxsFFPsFQ+xbJOTIeQqW6CroZEcnQbxt6SDxmE
	 mSQFh0mWLoNBOnC1vZ4Nfs1av66JUaECIDPHpj4dpR6BNniF5fZ50sOuQrNhJ8bI41uyJ
	 AiZ47jP91o6nmkHcFAMRJo4O/LJ6wTrd9aEvcVU6fELWxlB19OmlI5lcK7ZDnKmYeV1nE
	 /H14J+UitTeFzu36qYDZgFnm2b245hirGW9TnxVPapZeg3vlUqK+dGbnz0oaRcbUDR757
	 nwxikcR4BGCy4yQ54VH6nhnc2E5lzFMJqdWaGwB9MsmflYJLNLDMoRAvTxzJpiiELFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793473895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=1faUUDGR5nRO/CTYYf0/3t0jHWO2puxPNuYIuAo2skI=;
	b=RoVfNk2Emlo5nC7XEZxPbgjfkAoZsZN6ResxMuEAdFs4FxRFVDlBEv/OxkfqnSnsyBGU
	 Y48+7Ry/ePYpVYySiIYDVgGrQO7Y8FfdI4FszzptOiGkdCeKEUoPuiyyUxcRoXO22sSk4
	 LCwNEXD+CPP3ksSzFvlMMvKQFxqeYjee0xxBFkB6QuwXdMFBCYxwMpsWh2qQISl+ie3Gn
	 JQygnoxDtAPP/6zpMmXEUNAJo3kXCxwioSs2ywHJB5pFnbImpb8du0FLhu1Z6gJ0MjStX
	 7Tke+VvJ5TWDoqFV0LBawRBtUDucu87wbiZXYHSfVQkx6nueAERKjhi3rNbXpRioIrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFN+zf5l;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FA3606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 19:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81FA3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFN+zf5l
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so19828985e9.2
        for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 12:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793473894; x=1794078694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1faUUDGR5nRO/CTYYf0/3t0jHWO2puxPNuYIuAo2skI=;
        b=BFN+zf5lrY9YugjQE27xKVLyVI7HVfvBf7ABQ14rvvdBSVwzJmDaAIEmwL07Ww1h/O
         5Z9WlaQeGTCwC3ys0yjfQL2T7PPePbIy3rSL8A9SdYWdbHE4P9I6n/0we4jZWkF+tTOC
         WJcG8ULiASo8pSw4eicBSSASHvyN2awYKAj8ufatgu8zpEWRqELh4l9104kflA9Ff7ZR
         GPfK3F+3pu+smH2j/e32WG6UanVjYx7+rPvkq1ISa9IDnx3bT5uarUFrJc8itN7TGFFc
         Po9PkeCQ0dzZOl433paugqjwo86BwCRaT12Ingp+Y41FHjtm71ah9ik6aKMh210fPY66
         DMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793473894; x=1794078694;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1faUUDGR5nRO/CTYYf0/3t0jHWO2puxPNuYIuAo2skI=;
        b=ka2Zrcl4rS8cwdG+Hzt7IokktuIzukCU337nK/2SI/evRe41I3PwoeuToP8LfzEvAf
         eVNWE7iQ228uVLBanKdJNRQaMVMeemAr3KtHkK5NIClsx1fjomyLqfX62s2Ld1emCjt/
         AVFEBvdRXDkTs0Z2+Bw9oTGWeOtqXWf19b2Gi+G+VEZ69dx1pgUP7kDreY2Cch/rnKHZ
         NI/bF4W/GPkkS5uWulQoL6/AdlthtsVry/ugsVpEyru0NyM3x6tfjONV9LfNxI9xOjLh
         ECTa7VhWSZfgIYRRNQ5oCH8X5XbBG0mNd+jvo6k+oJ2lkxsjOJnniiSZWsw/r44VXoLL
         DDEA==
X-Gm-Message-State: AFq9FYK3C04sdzet8b4HclsqeAmDN4EpWelPsqruqRae/nrWz2f9rijV
	ko1eSy4C4HdyO8k4NTInEC8rAFu7e7H8VW/VkWyBdDGZ9Mb8cvnnmqxrXhIXXBB5
X-Gm-Gg: AYBFou1oCnwcrxsFfJHnBQOMkthwr/WKLLkIp/71AwBzchHUy+K4x+MC42xz0BaGcdu
	7/Q28wSflKj9uXPkp4xLXTKTRf/WoDRwJTJReh4ak0qw86KOHsAhiJADdhW5L1T6fHvL6B4MrCy
	ofYVJ/4N+TyKzidJvn8w1jpXDZ6wGZy+Myhg91O34U1jI7VJExf38PfXBMF+FvyXXU0mzuIR1zi
	ALV8sv0eZmt5N1WtWT6ysGGjrnZBqnal8lrlom/R9ZCHSsrElLPfUfrZz/T44M2PKtCyC+wvCqU
	QBuqPsgyqqLOz8CjF52f7FD632J9uOHWrXnzy7VPQhGz53Yw2+tAnUzfhFQPQmtJccDZXed3kqL
	gq/jXECjpVyydxGcWAd3ME4aN/ZM4ejXDvDs2BkvFjKyxVSmO1O8pItj43x1zq9FvZfGiqqmcvX
	IIFghRxAq/zCFOd80lXb1A29/9aPVYIV33Iw4BWx4itfQLThO/VAZcKHdJRdEgX/Z5OPg9R7nWF
	kl4B/WfrhBvZ59DmF7+b4vv2xP3LhAnRd//AaJUy3iyBEN0QNOZwl2re7UODZgW1atDOSEjtiaJ
	BCgfZhCSDaujRgdi38zHCQ==
X-Received: by 2002:a05:600c:34d6:b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4ac150b2192mr134219725e9.3.1793473893853;
        Sat, 31 Oct 2026 12:11:33 -0700 (PDT)
Received: from CachyOS ([176.88.124.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab69b54742sm313355605e9.15.2026.10.31.12.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 12:11:32 -0700 (PDT)
From: =?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <ycistak@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 0/3] hwmon: coretemp fixes
Date: Sat, 31 Oct 2026 22:10:59 +0300
Message-ID: <20261031191059.1425111-1-ycistak@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261031153528.3195123-1-linux@roeck-us.net>
References: <20261031153528.3195123-1-linux@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested on an Intel Core i7-14700F (8 P-cores + 12 E-cores, 1 package),
x86_64. I built coretemp.c from groeck/linux-staging hwmon branch,
commit 2b05d95c12b8, as an out-of-tree module against the running
7.3.0-4-cachyos kernel, and loaded it in place of the stock module.

Observed with the patched module:
- Loads cleanly, 21 temperature inputs (Package id 0 + 20 cores),
  values look sane in sensors.
- Offlining both SMT threads of a P-core (cpu2/cpu3) and one E-core
  (cpu27) removes exactly that core's input; onlining brings it back.
  21 inputs afterwards, same labels.
- Readings refresh after the 1 s rate limit: temp1_input went from
  32000 to 61000-63000 under stress-ng load and back to 33000 after it.
- rmmod and insmod again: 21 inputs.
- No BUG/Oops/WARNING in dmesg.

Not tested: the 32-bit jiffies wraparound (patch 3) - this is a 64-bit
system, so I can only say it shows no regression here. The NULL
platform device path (patch 1) and the core_data allocation failure
path (patch 2) are not triggered on this hardware either, so for those
it is also just "no regression".

I used an LLM to help prepare the test setup and this reply; I ran the
tests and checked the results myself.

Tested-by: Asaf Nuri Bertizlioğlu <ycistak@gmail.com>
