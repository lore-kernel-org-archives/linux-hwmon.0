Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974108;
	b=ZJG0dNQthfYVMWunZ49JI325Ua+m5lu8IHLR3V1bKebZy0kEACLQp7czl1PBhLnyXJYG
	 CLvlt87ttfsLnjvbvR8u9vvdpTa5o96f0pJM5NaLpO0Xpftpux07WT1O+KbXIM7pfhfCA
	 Fok0OcOROBs2RrXVMqbwtVfIRRY1wZvNp41dwapmw91JAvZq0wd/X3NPwKPKsJKblRmUJ
	 Ru3Lcr7Gn9gjBff1BxAmM2SoMbnlRNXV/tNVftCHB90nOqHmQgRPZG+rRjhjkKP2SpGSF
	 KWG/GAEd603n2jRmmcvCsxIsHuml+OwOo733/5b3FXKRpP1fiw6mlE2g8jg4bPdbtcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=pKcKgfb8CvKyXWoirq734eSIdlRSGIIBpTLfxYawV4M=;
	b=A1hA3kJEcFCMfTfd/+b1dQUtGwD55utX56NBdZXNfjovLiEU3HicxfQ0E2zrEHRLmAeU
	 jqwP4rXmHa0eDpEtz6P46VRL6d02Wo1sjTSFkvp/37C0RGR6PKAGkvv3/Vfai/BZwf3tH
	 +O4sPTfKhu0zGLXx30utWpWNB4YLFHwXIWvwH9OKCXX+2zPjvUQbwlF7EU+WZslECMKP4
	 zVR/9IPv3749pvnmxuAd32QGeBRDJlmo9WVEOnlk2pD4PiWjEXOojQ2Jtk3U3BW9oTGaU
	 RN7urdw3l6SBmCGn38bECUHsesMINOXTSA8tSlH20PMgWIUsJkZUIYpRsbQJlK6aHRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PaWCDMoZ;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BAC606A31B
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66BAC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PaWCDMoZ
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso108674a91.2
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974108; x=1793578908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pKcKgfb8CvKyXWoirq734eSIdlRSGIIBpTLfxYawV4M=;
        b=PaWCDMoZw3yyRXDbrZSfczHaQ70JsNzuYgXW5+vKreMrNfKI/R1/pd7t9uJN9wydW1
         NFhsvXTxkU3uJgQxascjIiJomFOFD7q+nqJ/3/wMUCoYxhQ7E5hnOBut+N1Mio8Q5Rlm
         7/zajJYrpMuLKsmFUqztordEMNVM6rm+iQyIo4DxEh881mIvq+e3q08DFPYzIUIdJ4C0
         vDXil6cWPkdSLKlOeNhfKKyyvNbtm63VL4tH4n+JAL7Vgqm1eoQA9SyqG4mtPEhdYnHx
         wvOoNpdd1Ct3X6Emj1HTHX+FWL0I+IRY4DvA0MhSEV3HRfxJUCkfWIBcbR4D700wMH61
         yaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974108; x=1793578908;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKcKgfb8CvKyXWoirq734eSIdlRSGIIBpTLfxYawV4M=;
        b=RC7r7F5P0mFoOXZYZT47z+sthWLR3xucmKhQL77qjK/iDKIAGYLrT6ME8cR98wNFYv
         HdTjr/rmhhv/Xzf6PmoT+/SMtKGIUwEPymvdcksuerBrHOFxuIqdI7qOTzisbuNwsREE
         9f+FvoF3lhrUUeCSKjqtf1d8O1XuMWMfslmdHtL2UigJ3N4k+DJv9j4Myvushq5KYa58
         AcGNmupGUDmdnv1RlJQ7fdFRNbkwRUpiLFeJIYbG0kQAn7Wg95gm6LWCuJtO5wqi9BdS
         gyyQc/uurN6mDV559Ge5B9Gsu+dAgxq2x0XWOxVMHB6XwIq4Y0gm5GG5CoHs/pIctqyX
         nQtQ==
X-Gm-Message-State: AFq9FYLU2fSSfL6GxkLxw4z1iv3iyYAuJFDf3iTM9CwNuYmUE6+aZSjK
	QKhNhifeui4byT8/G9ZDsDnREfarl3l9Ua4YJwZL5gIj7qMC2RaH5xEpcUiT4Q==
X-Gm-Gg: AYBFou2PJWK5a1De2wl1B5ZRYnM/L8/tLaCfMmGS83TUCN//4/RZyHDXXxUTJpmDKxI
	6EYfam1Dvg65Z6n10+1GFO9RfpFX4wKpoa/M3eFTfb9wL43T7szOkXAZdAncMvYRtUzYGrh9LsB
	fNol3j3GiNV/YiN/K+VkyaxCq+vquYhm0/bpXjY8lYEK3oDhRzW21qvjcEMzTMnZrp8Fgz1nlmw
	eaSTIP9HL0Ef17TQUgOBlwk3iQiTe7sHP4VnvziB4z4NR2bXrKpbechL0cNnyqbbPAK8f5s4plA
	HPQQ7KmVPlJ/jv47mgbJ2LfybtyUskGRvkQi6mc2+mZx5OP+oqOvjRKavQcY4mrKt9m1sEwJ5Gr
	RztcP0D53E5nheuKhzfAKGO7oMurXUrQeMBvJK0Uoc2atQKpQ80XSq/90XGcTqXBtcU8tw/KpZJ
	7i7zcaz63dti0q7240NzdBElsa3JHkcd9Cvul/NjxTTfoLFnosuBQl2f8k5Jnm6MJyxt2MQ5ApP
	cgf9TTnxVsR6RHyPlVi86MeMJnSKgghdzw9jDeBuTkIEI0jq32giOaYDg3mmQ6B1Dapn3k+KO6v
	JZ49xHP1BnMRwqg=
X-Received: by 2002:a17:90b:1b0e:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-3adea89942bmr4456329a91.18.1792974107750;
        Sun, 25 Oct 2026 17:21:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6af0dsm6015077a91.5.2026.10.25.17.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:21:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:21:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: hsyemail2@gmail.com
Cc: linux-hwmon@vger.kernel.org, Sheng-Yuan Huang <syhuang3@nuvoton.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: (lm75) Add support for Nuvoton NCT7715
Message-ID: <94bac7e7-9ec2-436e-9612-7e0e62d8e66b@roeck-us.net>
References: <20260918084042.19541-1-syhuang3@nuvoton.com>
 <20260918084042.19541-3-syhuang3@nuvoton.com>
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
In-Reply-To: <20260918084042.19541-3-syhuang3@nuvoton.com>

On Fri, Sep 18, 2026 at 04:40:41PM +0800, hsyemail2@gmail.com wrote:
> From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> 
> The Nuvoton NCT7715 is compatible with the LM75 temperature and
> limit register layout. Its 16-bit configuration register shares the
> TMP112 configuration layout.
> 
> Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>

Applied.

Thanks,
Guenter
