Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63C0366051
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470074; cv=none; b=BS7zf06PYPBoIonBnWC9a0GE++4rYUASZ4snfklWnwUOKRlLZ9y6bnCIuYffFzYvJFGOSpZuDNhSPKn7QUhDbJEtur5/wfIEsUtUlib7fXMZfi/IPRyPjzbwJbGCbcwUDmpH4FDTX0JdKbrPGCBr+Joe9PleSerUuTUkfss5fOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470074; c=relaxed/simple;
	bh=sfduWV30PNeX8xeGhWNbSmMOWpURGqryQpBC/Pk4BEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eI1fKVa+qEOT5rV6hZLhmJlotNfLCZFfX+C4gl+h/5mmyNzyrrefSXpiLOJup50CyOCgqpUxh9FhlfL9U8RccGjpzwm5HxlM2PnYZXE+XnQdjO/sgkVdn5AAOTtIxqpd9RBap5M1lMpg1bk1JW2IyCg3mKwDLa4eguYAlJMvOew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUdzzvY2; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUdzzvY2"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cad4170e8eso124454585ad.3
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470073; x=1785074873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sfduWV30PNeX8xeGhWNbSmMOWpURGqryQpBC/Pk4BEw=;
        b=YUdzzvY2EpLj1bK6xp9BGme/RjwmdXZ778g6Vv9SO95mpScMIPrBcKT3Rl6Ph6xBjU
         EBfsjsiV4hcpk2WbdoHiYarQ/IiIAz5VEC+RwyQeZsVkM3EvLlcXf6jITGhT3Q0Nx25j
         qSt+iC1JjvxqMlmDEU00wRvOnqJmD6iW6QoiwMV424XmXvT9Py2wQTiDEjKV34T5r6mQ
         IR+Jh4G/Hm/IbZ0b7iovPQCwxYkcEVPozilKFxwntv6r2eES/5oDhwVCU9VNrKKJypUK
         sSmtrKZLkuVPBsFCd6EtjIBbp4TVKR3NZp6aaZgI8loTRjndeEFwUfqMMDbF6TQKglp6
         ZhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470073; x=1785074873;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sfduWV30PNeX8xeGhWNbSmMOWpURGqryQpBC/Pk4BEw=;
        b=EiwW9p+22HkQRNmGIvuIuM8v72josbPlKu6rgLD2OKvGedelQ4HMbs6lrWJKukXXWY
         5zKfRgSlpihcuI+wALsAIyV1b7FpRX66AJa2pQTM78914CSs9NVBWhLr3Yz8x2McumQ6
         m1+6EDY7Finr+HpoWd6snVH1RcQV1Q2EnQL/W9tFIEES6NUDV5JebjEfsy9DIffE7Yg9
         c7VnU1LogEWmZDrJa1I8kavBuwk3Wh8ZuiO7OZt1DqJcuwLwtdTOjJ5tI6CrogxUm9D8
         SaThGZb2X7RCqwKzCxTtBD8oY7bhKf1Fujmpu+td08sfi1uc+pTW04YOvc9dzQ0NfNzM
         Vn3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr4Ei08vRUfWaGKoSNrhlkr3F0lmqtFtbdsSQ89I1eAY8w/WyS/XSH/UPtxTzm78PApQSuc/PMJfflYuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYdbSsioF4ho+Ng9y4HD3zs85ADiA/Zg4XujyLfoOte4HJnie6
	hhqqPB63/HMWRCD7qPK4l3mKqqdkFqO0DPa0nXjyAJYwvrR5vDf+jKBA
X-Gm-Gg: AfdE7ckcCGZLhFl6nTzzynz97IWCSeBPp8fGI0yZ4Ih0pUSQqzF1bzEVxBSkapVrQWK
	hOQYIPIWJ0l27u6Xuib5KDh/sR6CPdS8OKo5Sdow8HlwNNQ8HwrqOhNPjC1JnIMU47D9OAmGbSP
	TK67nVAsGl4dyJJZTdopKh5OsVgUPSTn1ONVp5SiE+XbEBtFymhpcRcyg/ySmTaCcsUCwx45xAj
	qNofiYvVzB4Q+l5MakGCji5pb39m29xWGwU2IkuyB0XXQjAJabd36lXe76AAGiILXgoKIbL/HEq
	GSpoz84E7zws2/yu/aAnoK9D61Vd9tBCb+v1QGGwFgSMmYt+Wd/lwbnZQWeLpKW8spim8gvEVUW
	D9Vt9fnhp6E/DQx6BXB9nClm9slHuKm5lQkU6BgJTF/2+NuzpP6IXROIZpGe0DzSKTPguVFOF3X
	8dO/p0OodIbgSs1c0=
X-Received: by 2002:a05:6a20:9397:b0:3c3:8de3:8eee with SMTP id adf61e73a8af0-3c3ad95142fmr11701831637.61.1784470072965;
        Sun, 19 Jul 2026 07:07:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb519aeb6c2sm3250944a12.21.2026.07.19.07.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:07:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:07:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pan Chuang <panchuang@vivo.com>
Cc: Sanman Pradhan <psanman@juniper.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Remove redundant dev_err()
Message-ID: <6998fbb9-a268-4fbb-bc18-72855922dc2d@roeck-us.net>
References: <20260714130228.449233-1-panchuang@vivo.com>
 <20260714130228.449233-3-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714130228.449233-3-panchuang@vivo.com>

On Tue, Jul 14, 2026 at 09:02:25PM +0800, Pan Chuang wrote:
> The devm_request_threaded_irq() automatically logs detailed error
> messages on failure. Remove the now-redundant driver-specific
> dev_err() calls.

As with the other patch, details are missing. The above is, for me,
just an unsupported claim. What is "now" ?

Guenter
