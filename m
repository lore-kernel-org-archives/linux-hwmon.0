Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974984;
	b=Eg2IPfrdAd+RX4PtBW4Y8GbWs3vQ6kXMKa4SucQrd2INrlvEqkZf9XpeW7bjPCm2NNLO
	 8Vsw9fODmLtsp/ff3LjYSswm9vDUID20VSpORCWcsvM0syMx+vHYCYisZ/a9d942FtBvW
	 Pl0xlDtxNVd/CnGLka3NbwpY/A4ygN6MpLi0sAaJaoqJUUnnzP7MKMPwbbdP6Hvte8jxA
	 vPfh1QvMLN8Xzln06WzCtGlO/LoIBbQgEXDRg6ByKJapEui3Qs+YiRuGtLxLKPAa5t3rz
	 KWvfBVe6zOQmBMvqK+NFeaC+eiqmVrh9HdX42j2TAkuZssl7Vd130a7zAEIJQF5OSmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xKp+d3bHeDhxK2cX/G/plq+5MAzOmIHe2O0mVksp/JE=;
	b=id+Ij6gpiuyjCiy1YlDmylQffSaI8Mi/4DrNWa2mWOuptt4e6b+wpDq47YHl49EFF7Zg
	 pu5tvUyEPUM1v4F6fi97P/CSXQRHkS96nhTx7on7b8XZF2Ml17KJb4HaK/QVf77+QxQ9J
	 7kSkBeQzUdFJmKyx1Lb+4GqklSvQLF+ivffOux9SjBB08z9wBSFyOdiZTlUIkGRpn1mN3
	 JlpxuLL506htuSE8iUPtEO1IzS0jInXQdaa0Eff+vEEoPgJ5e1Swh7UdMM96s2bXt0N4s
	 LiXIPIfrkORmZH3ypdD1xwy5xF7ulAS81DB6I1y2ZM/NN4URfG9Hs2xUQbKBQCi4/WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="A/k/dzgx";
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25D2606A31E
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B25D2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A/k/dzgx
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a05effaf8dso1562980b3a.2
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974983; x=1793579783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xKp+d3bHeDhxK2cX/G/plq+5MAzOmIHe2O0mVksp/JE=;
        b=A/k/dzgxFGHZlnRPKB0uFI6RamiDqcObc53ls5NqfEmj2xDJOQswLIvnDVWhoUj/1S
         OOsihDiG+3Gv4PBnR6VH4yMr/F6jxy0aYVKrnXYEqnVrf/XCqBhlqhLjIMbZGiHXjYRQ
         TtFUzok0tjLSq+9JtQbSdfjYDhk0oezU8aS86CtASqyVE9eXcAL02GPUsjSEuE3Ig2i+
         2mCLr88OhzqJtBR8P4dYjmec6q2utQ7jzwRnurfkrYWsPB3Siqmm8WkE0Ahey105KuHw
         1jD0MT7SCTK+x0qX4z41EntpYGV3zofbXUldvJVBFsJrr0C5UVQlqm8MTu2dQnz4eACE
         Stgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974983; x=1793579783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKp+d3bHeDhxK2cX/G/plq+5MAzOmIHe2O0mVksp/JE=;
        b=HZeGgPHW0OwRrWfFj/qs3EhR2/KvsRk8CweZF08HJb/tXL70k/PtZBZ2KIALrNMbdq
         yVmdNyENZfCRVg/TyYsK9wcNRxI6kKkNbd2SSPMV63t9aIFls49TeIFFw5rOzgmzBUqh
         KXPwpFoRDVCf3WHRHdC1CRms/xGBGJ9ssccHvkr03Zvo/vSEbM7mnjjpM4Hj/jRGfiuk
         yoXQENHR0eRoLJ/W1ih2mbOY+EvXfqpMyEXg8R+3EilD8fKgjMnKCaSh7S5NzuB0RX5j
         fzczpvbWbTtECDgzE++b/qa5TFSd3UI9CgSt73glMVvs8LOETm3tvcV0yO6+mKZQMERJ
         2hcw==
X-Forwarded-Encrypted: i=1; AKwUvBzF/qqzKKqxdaBpQ3HHlWKr97la64Wjcy/ybvUoZI0Nsmwylj9J0dsux5Z4ryu1zZRvYwfjtshWdBGILg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJEZ0XKrTqCxenS35EGY7F+KbucqdK77Ml+8j5nmglDHo/fxlui
	BD8+SzAWXGUqRri0orL3rPBzBmyYByIhCPbtvpQXUAt7e25A7hMRE5i8
X-Gm-Gg: AYBFou1aPvDZu4LF8rat20bORRTOC+T0ZR8J9F8RJXT+O90TvZI4XdsLezoI2Pa+ybA
	oyhHAhXHDWQGcASeDSjUL3FQtRwZR3XyZ/DVAV2/zi8NmB4GQwopXIOPyO+kALSPOgb8is9tnfm
	dyuNupwEPbS6PMRxSrA/71jwAQfN1cOTHhceQgS/EGNBYB23Y0OfEOPkFgsvBwbzCZDv+qIrZna
	oojshFYKXlefOgUso1bBuseEjjTu3qDuEl4t2yr0fsgKz3KfhXDwwcySjhR4fP3eRFEdOPYEIAF
	CGePaLBDA5th7OB3yUgb04vmzEPrnnpds5BUmkxxSn+v7mdnteQDf5DxjjpQcSweYVwrEZdFUGf
	MgOvqtM9YYadOBeOu0p5t26bjBHAH/76nHmaNRcajvDaabdZ+WsTnvgQxJZgmYTX8qylFdHOU+5
	P0FGFrZVQurw0u25jBpGqW+VCFm2w1qf+xZVtNyBjjLQ0nbdiCbWRJ6/kWT5U/WUX2MVswX8GNx
	mg+8AKMPaJyo/CdofnRRMLUVMVN/XihUwOY/eMPWAcWDTIOEYnnWvyt2CTsSNl2jEuIPA==
X-Received: by 2002:a05:6a20:ef1b:b0:3e1:c08e:38f1 with SMTP id adf61e73a8af0-3e7cd4d9f61mr3858101637.14.1792974983056;
        Sun, 25 Oct 2026 17:36:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d86790sm804169b3a.1.2026.10.25.17.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:36:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:36:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lars Petter Mostad <lars.petter.mostad@appear.net>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: trivial-devices: Add TDK FS1412 and
 FS1525
Message-ID: <b5298436-ed79-40dc-996c-887b2d4bca73@roeck-us.net>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-2-27ece4e43d04@nexthop.ai>
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
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-2-27ece4e43d04@nexthop.ai>

On Tue, Oct 20, 2026 at 08:02:06PM -0700, Abdurrahman Hussain wrote:
> The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with a PMBus
> interface. They need only a reg property, so document them as trivial
> devices.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
