Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047692;
	b=YIEplh9xGvQNrIgcd/HAmoSGBb6gICmP6UMB4oKCEqkeE9QrVvF3ncNEjCsjg0NCqzNt
	 9nTOhW5glCalMreQzSrh5AT8h+gITjrjhvNPHVHqcfmcTdP0FivfbhVbN+bWM1aC5SOBa
	 qCIf08ofn8YwdmD1XU7zuwJvGHETLMF7MYxKnVoBF7xvVXr4qoNjwlW/vqxlzvcGM9Rys
	 8HJNilVayt8tQ0gHCMzhNondDBgfGyvpDnYYT/z+mZrJWfiFB27xusG2XF9pjpq9ppyAp
	 zglhzmlM+i8xAuTjiuLAEPOQhN+mCLq8WBm3EpWOL43pQe7cDRpJbwg0TzzyhmBOGPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Glp98pc/SIynZfFFbJ2RDbYRZ6AZRnouVLPAAYzRp9o=;
	b=Awd9JYjQ0D0SitsNi5TaLEKdu3a0Q/q/SBeyowqcBS9tAKHoPSkoXhUh+4a1x2AMsmFe
	 Ka46XlMpPDsHabq2lkbUt8VsjynnL+k5LN9uobj/aMfxzE87xFRKWjy2ipbDAK/hUqmom
	 2+IUxKGHJ1XvBB4aB3GfPdv5dPlLssRBQlZazVmFq5mjZvZ29z3uz+4zajI3Gt4/S+r4E
	 whBUbOLMlYbPQAK7d/H9tTx14mQAI6yejvvk7g+VUeXeSG/su817oBrY9tV8IXlsYCkex
	 zRAko2yqgsSWKHi3Xa1giBnloU2kKll2LXAx9FCNe1KPnp61OHRu/ZBUZ6TEOnHt/qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KTZC5w+K;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26CB606A31E
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 20:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F26CB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KTZC5w+K
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3550c917fd3so5160819eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 13:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047691; x=1793652491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Glp98pc/SIynZfFFbJ2RDbYRZ6AZRnouVLPAAYzRp9o=;
        b=KTZC5w+K8RiWwTzcTwge2bRfsNiXTSiL049VP2sWKoRAF4OVkB6fg8a5vDxKXAEWoH
         5lhPqe8wzjSyi2HbnmHEfpe+BdXH/x+IQzRpSOAeNbEJ3wfT5MBGY0tOp7bmxzU8MsBV
         b5ub3iyL6GNijJ6SHc/fJY2ZoFm2TVfw3wy8TcsUzK9mEiW7KFqurL7h78Sc6nnHOcFP
         ZmNnYkYRG54oNH9yvTFDVkVzZAmdeI1HR4CbbpcNpR/Ax4mp+uNoljj423qaHhOts/wC
         GZrbWxqzpe4yuG3VAP2VP48MfPAMm7kcr54wgATuJXRmFq2mZKMunxSM3Zrfh09wWq5T
         trtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047691; x=1793652491;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Glp98pc/SIynZfFFbJ2RDbYRZ6AZRnouVLPAAYzRp9o=;
        b=Sa9LiRYBireAOer0ZgD+1uiEUl1zWXWZ+fMeDBMMa1uAu0p3260cDI8oS7p5blt+wt
         Nw99VVl2TTsXWclvhzhpeLLpcADSEqYcmbQXE49/DNAEHG5Rr0nqqLLTJ4pYYS56UpSL
         sIh0P1SXij51rS4zIsQyiAwVPMKsnl5qiHlAi0+ZCCvzePz9BKkyNzpvsb5u8ppc0YDK
         YZfhTP1BGaKXqxjiqHpWh2sQjaemied9B6HJZVRTKIvYeUHYL7JH05/NBKxzsoSP24EA
         Y27J8ySi1bYM9hPy4oUlsYQEsbr825EcF9VTjU5SF0QjgX/gtXeNAVr/9zresxPBBj4m
         8Pbw==
X-Forwarded-Encrypted: i=1; AKwUvBzohrRK6Tzco98mmA3b3fHseXomrkrilqvfbqo2QH2zRtNv4j9JLpUoy8F0yc6KQN80dSdwjKxtJlWhPQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIG+TxreqbL5ycJ7cjlgTqp6q7d0WYTnEhBaG7j7DedZ9SA1iEr
	K38Xo9TJdvl4DrIUUqSXT8NH/0DpICKEOlxV2BR6+7hJbhgTqtsPHq13
X-Gm-Gg: AYBFou0+fgcQjlNgghNVLQp+oAOGOsun/BTD2tMR2zluZBE11uBD/HLq2ZnrqJen/gZ
	yXWC3C5g1LNVIMv9e+O0mip4QVMXRs7dsRWeFUt0XIBMGji8ujvB0wuDJc6mDmHYb6KqYZ4nQq4
	RZ2zGBG7mzOO+PR2R7Ehr9yuYFNQwHKdYdPVQarOHvyajlBVE96IyygAwAUo8GJtUDRC3XvZi/l
	m2IArORBn92dZ3ms2tOl2m/RridisGWQqfU7HL2YDEZkK3nNSTYyYuDjL179Q4haioEW8VyFqF+
	4ENClH/C40e6kLHeoI2t5lJbVg/uLP7nm5CelqLSucTtq5EaTEYaWIERtAC1IlazjlvotXZliNK
	KFHVahaxXwQecb94uLWkbFkHAwQon398lhDMIX7hHwSRQS+NlSPr/mU2L+Q0j/6PpeK7s0S+W/8
	ncr8nk4kIj2CDz1n/3bSp41K5MdSxsnxObEYVLbC/EUI5DpX+S1VQWNpLZw08hvhGanI8EdTiLX
	50bdc4yCbA7wL5wXQqs+W1Jq1s5nozEeBMMnbA+Nf6gxuXwlrq+rFQtYckKb+ZhKoTvPabwyXuM
	yETUFL8tP6aFXHEkeETe2PHpXGg8FGnRUE1MyhXqorQ=
X-Received: by 2002:a05:7301:fa2:b0:34b:5ab2:e200 with SMTP id 5a478bee46e88-369e8455879mr10717768eec.14.1793047690766;
        Mon, 26 Oct 2026 13:48:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm51555058eec.23.2026.10.26.13.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:48:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:48:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vas Zayarskiy <contact@vasily.cc>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 2/5] hwmon: (aquacomputer_d5next) Expire the initial
 sensor cache
Message-ID: <f80ee5ea-a00c-4238-941f-5644ea966f7e@roeck-us.net>
References: <20260927191316.4137752-1-contact@vasily.cc>
 <20260927191316.4137752-3-contact@vasily.cc>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927191316.4137752-3-contact@vasily.cc>

On Sun, Sep 27, 2026 at 10:13:13PM +0300, Vas Zayarskiy wrote:
> The initial update timestamp makes the cache expire at the current
> jiffy. Since aqc_read() uses time_after(), a read in that same jiffy can
> expose zero-initialized data or skip the first legacy report request.
> 
> Initialize the timestamp one tick earlier so the cache starts expired
> for every supported device.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Applied.

Thanks,
Guenter
