Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CF437F31C
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 19:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788206087; cv=none; b=Vx8aQ31ikQ4i6azQVLZJs69qx14hWpUDqwkNPL64bCdaaDyy0joeuJ3F9IB6oVCtemn/1KOKwS9wND4oqjBESMfzxo4U9P/BqMMFVyh+OToxxhE6FCq9tOIIH3l5Bz8dNobk0l8l0mitpt2EllVTPyzryCsFY0ZYioVH/g5f/u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788206087; c=relaxed/simple;
	bh=15a0LTGeYo8zOBmJgo/ZnXR18G1ReDCB7rXXZZCKKl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyD4QQs6Mctj+uM1wLMh6HT8Bxkx2VxiFoq+2pAEk8xlqCcJ+TFxtA2fGjRXWkDuq5YDpkVVKYdV5vhCzDgscv5IOohdrNt8uOZ350bN24efvsCumUmA463vNOfXYwSYz+FZ20Thv2OagCUql5Gi0KiUz/w/F0+M4UeSoi2qxZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5mdG8+/; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5mdG8+/"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso254627a91.2
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 12:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788206085; x=1788810885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qskMQe4LjjXVBmevlEbg5fLbtpZ04tZedzGfc/8LuW0=;
        b=b5mdG8+/v3oM6Xkq6J7oJifckucns9gZJtWFI6tXignqoauDA+DcBWQ0QgWMYSwXEQ
         cWKHd463q8yEIlmdhSUTtO1VHeAY3JsZeGR6kyxnOKQmNjQ0jT839h0eN/YL0UU0TUxW
         gTwYFKybf0Q1crr11KG7SPWptMuo82CLXUN6NP4jLzuhunaaUUIJSiQpBjLlDfEN+4ew
         GNAERpJ1ngrKgr5PCb/XTbjmv1e2u6RSy43m/DXoNNT9obNVF/UeZSXdLXgfasB6VA0/
         q1s4lAISNZqYOba0GH7abpGZhbvKv1i1plU0/+psKP1ceHSKXlYsnIGmyfBx3dMVymqh
         4PWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788206085; x=1788810885;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qskMQe4LjjXVBmevlEbg5fLbtpZ04tZedzGfc/8LuW0=;
        b=gSKC/WnzAn4jn1OsjeZj7P1MjDunhfqRBzCjiHzzJL+pHlHT3SIkYm2Zm62dKLLtH4
         nKvoT8zdYFRqG5/xZ3lF9nZvsMdWfmQ++ZMnbRCULCr9gB+ORBGS+N06PQ0Mn0M9UfGD
         +w2Cxwfl3/sQzmZbwrdUyvEQJqoLhpeTsFBlpNS7ekw68lpJyVkSasbuT7/szNNCHtGb
         IglzFeC7q8SEFURA8Ujeugk5v0TtRuvGKpDtvNgE/PwW4Ujy1UCYAsnEKaaPIRyD1/yS
         EV9JMJWMB54ehzGwaBfBnvfGferXgH+Jk0sw+bgcres/GaTFTNCA6LoLkxut0jr7zWP+
         jfdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWhtX37B9dl7JulQP3LHZFJZE9kFj4GalBRkOE35EMvDooxaCpEvNXL7W+gl9sPvb4xkszTh1GgctF8g==@vger.kernel.org
X-Gm-Message-State: AFuF++nLYUODrPvvfYALvq3ZkNnlHynVoqRQuQZaslu4jbb//w53Lvva
	Tmwtc54V34LR47xodkd1y0giRTeUWzfOqr4HARAohdpzqQUADocBEmqg
X-Gm-Gg: AYBFou3YjbpFIoWpWw56ul7bYhQ2Zr8PdnDFu5QMKn5glY7yyiBrfWZVWrm12OK3B9Z
	ECmT3F7yWwYhLIcnUYU77EkkCWsqFIHHfqgH/Qt+rlfzvH7eMPFFXAZ+t6BpTktv+kFOmAtYoJc
	sNMprkF9Rjti8QSSSYGB9p/hRYK7EP4FBRFCgz7t/OIgEtRbNCCAf6d6eDzaaNUu2yBNiBHiuun
	gsf6kQ96spJCKCvTTFRP4PQPD0XG3mqSJq8cy/1zoU4sMiyDE0x3yBNS5btYKunq8CPGcRXjxKX
	+DdrHZT0nYesmXjEO9fHIXka+WlmoQvuxbaT/A6wXUEuyszE1krItrNZh4nau//3wdP2I8nyg6Z
	BSJmSwZvsV0f/zV/vtrhkxZnM2OBXVOGh2+EgM3QhjDdmqrYSTag4skyHQw1JVR1ctpagdiYLy9
	HKUrjCjqvvWIFn0eryzANVSTmRFd5nuqvWhQIenb7QIIdqXkziUbtU5rqEBkZUYcZxjC1AtxlPA
	cmnsJMzUYAn
X-Received: by 2002:a17:90b:39ae:b0:398:deed:6e1d with SMTP id 98e67ed59e1d1-398deeda0cbmr13260559a91.5.1788206085513;
        Mon, 31 Aug 2026 12:54:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d40ac7sm29241613c88.7.2026.08.31.12.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:54:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 31 Aug 2026 12:54:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Asai Neko <sugar@sne.moe>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Eugene Shalygin <eugene.shalygin@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add ROG STRIX X670E-A GAMING
 WIFI
Message-ID: <ef7a4a5d-33b7-4e9f-87f2-2bc1111ca4bf@roeck-us.net>
References: <20260901-asus-x670e-a-hwmon-fix-v2-1-759406c2a61a@sne.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-asus-x670e-a-hwmon-fix-v2-1-759406c2a61a@sne.moe>

On Tue, Sep 01, 2026 at 12:18:24AM +0800, Asai Neko wrote:
> From: Asai Neko <sugar@sne.moe>
> 
> The ROG STRIX X670E-A GAMING WIFI is missing from the driver's DMI
> table. Consequently, the board lookup fails with -ENODEV,
> asus_ec_sensors does not load, and no asusec hwmon device or EC
> temperature readings are available.
> 
> The board uses the same EC sensors, access mutex, and AMD 600-series
> register layout as the ROG STRIX X670E-E GAMING WIFI. Add its DMI entry
> using the existing X670E-E board information and document the board as
> supported.
> 
> Before the change, there was no asusec device under /sys/class/hwmon and
> there were no EC readings. After the change, the driver registered four
> sensors with representative readings of 57-61 C for CPU, 68-71 C for
> CPU package, 43-44 C for motherboard, and 49-52 C for VRM.
> 
> The readings correlated with nct6775 and k10temp. Repeated polling with
> both hwmon drivers loaded produced no EC access, bank-switch, concurrent
> access, or locking errors.
> 
> Tested on an ASUS ROG STRIX X670E-A GAMING WIFI with BIOS 2704.
> 
> Signed-off-by: Asai Neko <sugar@sne.moe>
> Reviewed-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
