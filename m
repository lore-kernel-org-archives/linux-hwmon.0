Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197E839F18C
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 22:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773786115; cv=none; b=m8HHzw+4WTk/BkU4aZwy10PeyxAVyJs5o7fxZ66p4oZ7kqZXx5xkLe710hVdDSCeAtgUrUKvdAekUWUH5nIKaSKZffhrKFv/tyDNIT+NRNfFGHs2RJRt/NLRmQEed+Gw0FBibo7SadYNmpLTxL7y0pksLgjpxOpC5tO38UcoBUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773786115; c=relaxed/simple;
	bh=XnVsP7/5zkWF3z1O4+8fBwGTX/voMAX58gTtGPTEWYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGZ8ERCSeiFgby9B+HtypNg05lfl6q/eltqDOSJGwMfeLf86unW8jWrKXbPTivMsIpHTXSv0ZySdrrSD2zE9amTUGSlKgZ06K7bAsFLA1/XX1xjm30MA2KWZw90pk+ty1G9QrrF5qyRLRq2wItzq6IgFoQsGzMsCNpdejwCgd6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZrQrk9h; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZrQrk9h"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1273349c56bso9681868c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 15:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773786112; x=1774390912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9cdnqRDoqmYIcJosBdr9gdcUWkn/AUmemr1WXNUuBw=;
        b=VZrQrk9h1d5fuDT0KQQ4yGwp4NNXzqy3M+2DV/yjkhA8c6W5lHEWF/QoZe4r/NI9/+
         hS6fi7dvsqEIqFcNd00AU6Ym8bprWLeHMZKw4x/6cBFCR55zhWjoYgo/nCxdv8jv/rnQ
         J3cEV9oKyVojSWd66UYbvA7LLPoJN40vCCChqUtZSpgE49qqwFvY+EhWA4ytc37Xm17L
         uod0igYTOQofqFvIpO8mZp9htxdzl5hd7LDz/6/K+zHj5tycYUpl2TyV2eLfj5gw/uPN
         9AK89hk8pz3bZHQ6LEY0oWm4v40OuRidOFzXm6PNP9j4w/tpZR0cy7thbJ5rRulH5xg7
         gWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773786112; x=1774390912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G9cdnqRDoqmYIcJosBdr9gdcUWkn/AUmemr1WXNUuBw=;
        b=SNDuzEow6QRZiwm3J9BCDGX2lEgODPBBqeCF0l5YD1eU2y+ZFhmqnSmGQUe7n9I5GT
         1TukLQgHgoLz3kXoH91Guzg73TY6LRt6yfkgEis7Zz0HzwreTRfnCjGomqpWckRJWlay
         6KWoDzwnd8H6iiXsnMIkyU29hTvkTp+djFlhmWySCL8z+mEVyF79zU3aV72iAyZanDuE
         Vk7htoGo/C3haRAupcOzed3Ixg2Hl01pTgyBVlRmtrFL+XT/Ra/hXWlo7tlJeCDj4tTR
         RCtntfb91aVLwLKmw8hbBMpCQQ5RL7Sdyns1dxmgweEwVGjx/U4O9Z5dwnigqlBDScBF
         9hmg==
X-Gm-Message-State: AOJu0YwG4MCEh5lJtiVM08+H4eFFR/7lI2OB43HjBZz+InhB7kqsFYfm
	S+nmQ2XFdAd2OjMoB8s/czF9Iu+QMEQoq14tj2ROVjp6/uxDMZCPxVSP
X-Gm-Gg: ATEYQzz1BT7VKt8I/JzOXYuUasMR34htUaCRZezr+Ytz6j9QnXeAq2Q2mz80xadZ3gK
	p/Jx0B4Y/iMU7Ma2u+IA3arQCGWzWffrybvd2bcoy3sanztoZKqsg2fspWZNvwJJ4bZKGjj4pQh
	/JCMIUP4nFhv+eFw/mhd7VfHDYniIkDaPqmeVEAbPcobnDT/kAemEiWTHB4hk8gkAg6Gc31lLeo
	pzzRW7N1b90fG9NT7iMHQxqQ7jEs/LAAUtVo1P3es5x1W6SHytRiqwijdFFUIe41dy/9U4Y35UN
	I5WIlRe0FAiOqn4ncIvHMwokkhVzb/mAqaXkFjro10lResPPU17RMS7DiKpz3LaO8RQOiiObxj4
	p7XU/ca3kVuKXXVyuHbzJKTV8lNs/PG6k9u5r8/cI8ev0BCLoFa4B5EbjhyI72QlBmfd5XKLi0o
	hZWOE+CTLRlnDML3jyL9oBt0CXrQwCKQe/zlGY
X-Received: by 2002:a05:7022:f91:b0:123:330b:398 with SMTP id a92af1059eb24-129a70d5e0amr663838c88.19.1773786111970;
        Tue, 17 Mar 2026 15:21:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e5368ae6sm1314541eec.6.2026.03.17.15.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 15:21:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 17 Mar 2026 15:21:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"vasileios.amoiridis@cern.ch" <vasileios.amoiridis@cern.ch>,
	"leo.yang.sy0@gmail.com" <leo.yang.sy0@gmail.com>,
	"wensheng@yeah.net" <wensheng@yeah.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH 4/5] hwmon: (pmbus/ina233) Add error check for
 pmbus_read_word_data() return value
Message-ID: <103369ea-f4eb-4858-a72e-3f9bc00bcc48@roeck-us.net>
References: <20260317173308.382545-1-sanman.pradhan@hpe.com>
 <20260317174553.385567-1-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317174553.385567-1-sanman.pradhan@hpe.com>

On Tue, Mar 17, 2026 at 05:46:31PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> ina233_read_word_data() uses the return value of pmbus_read_word_data()
> directly in a DIV_ROUND_CLOSEST() computation without first checking for
> errors. If the underlying I2C transaction fails, a negative error code is
> used in the arithmetic, producing a garbage sensor value instead of
> propagating the error.
> 
> Add the missing error check before using the return value.
> 
> Fixes: b64b6cb163f16 ("hwmon: Add driver for TI INA233 Current and Power Monitor")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
