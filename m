Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794067975;
	b=P3jxAeb5rfN+dEVjJATKQGUd+vP/IeCxIhWBnfxkQECxnxBiJEmGQxqyJKHfqFDVg7sB
	 x3GcLu8vWFQwld9VjTjlkvVPrz9jwaGtLbcftZiBl7Zo3aJJPRCdc5qOXVjtYFEcDd+MJ
	 nqHiPFnnA8yND1BGKEOUeCiEoZjfsfYht4Wg8hzIkZ/BT25fm7K7SzjeumIX5atmBsWGU
	 cq333r5Yo7JIsyQ0sc7YOtfL24HU9I8ZntsWb5W5MZQCMdar6s3ovUWs3zxGKwUpmGq3v
	 IRmtdFoYWNFKPzfgs7gIB4yQUNIKVpwR3DSz4XZNkJ9jyd1HxnDTca26w+HvQrsywvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794067975;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=OHzJlnbJeSGJu2DkVpM4i5PmHnZv7asqCcjRdX8cL0Y=;
	b=TvuSB6+lmcMF0mEzmbgk+47QWUoRwYlclWdQRkU6aqDKILNd9j3Vgl+OcYG+gHe+MFN/
	 HcY2/GtFLi85ibMcG5Md+JtyTDkVx1y0V97cUftr1lTmyuX9JlBRoYoZTP1pDvsW1t1EI
	 9W08WYRBaeerh4az7oYbAo1nse0+1aCSShjnn4h5entyNRfchxotOKREVwV6T0NHlZ1YM
	 AvsluEoa4HyqJ1Tm/RlMEoLgynj5uKJp8HRR3lHDU0WAcCqChO1OQT7gA06e2KxeFZeJn
	 52BbBwGm9wiTT9RkEI/JtHT6VKaG+0OcqOSKGKVyK7ZIh7hFKmV4rarGvRwQ6iT23IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=eijMRUW6;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DD3606A330;
	Sat,  7 Nov 2026 16:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5DD3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=eijMRUW6
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jMLg625hBzKmMt;
	Sat, 07 Nov 2026 17:12:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1794067970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OHzJlnbJeSGJu2DkVpM4i5PmHnZv7asqCcjRdX8cL0Y=;
	b=eijMRUW6AUWLlEWiCGr49qQ+2qjcsR4xivAg1Al9nppQGZW56mhkRtQfWYpUR6uhliJdVr
	aE8pfZpZ1OM6U7vkK/F/d+KENs+plNfvoOKhTEIYSjW2qUm5qLqaM0uO0Ch6rvJZgz81V6
	FhTJ2v1VV/TlOhOzeqIXULBYfQvXoCzX/hxcEg26oIMZ9zI6RMETi01miJ9mEVxrOcmylg
	vXom7H4fVLa9f3+aJQVzFKw8KJCj5h5VMoV2mKJF/8P9cOzO8PLqIPOhcJiqJ6du2gXafT
	+ZUt/1eJBcU0YLXUmKEPswG4i3Q8abMM1hfjQ9dXwhKqZNlQSHc4sTLyWGS4ow==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: Add driver for MSI Mystic Light controller voltage sensors
Date: Sat,  7 Nov 2026 17:12:49 +0100
Message-ID: <20261107161249.336512-1-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <812ee6c0-82ac-41f6-9eca-1f17c6ef715d@roeck-us.net>
References: <20261107082821.8257-1-tomasz@bojanowski.me> <812ee6c0-82ac-41f6-9eca-1f17c6ef715d@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jMLg625hBzKmMt

On 11/7/26 07:56, Guenter Roeck wrote:
> Alternatively, I might give adding support to older boards a try if
> you can provide information how to access the sensors on those boards.

Thanks for applying it. It would be great if you could take this on,
since you have the hardware. I described how the vendor software
reads the sensors on these boards in my reply to v1 [1]. Two more
details:

- The vendor software reads up to 10 input reports and only checks
  that byte 2 is 0x01. On 0db0:0076, the response echoes bytes 0-1
  (FA A0) and 9-10 (01 FC), but I could not confirm that for these
  controllers.
- Besides the bootloader command, output report 0x01 with byte 1 set
  to 0xD0 resets the controller, and feature report 0x52 with byte
  184 set to 1 writes the RGB settings to flash.

If any change touches the 0db0:0076 path, I can retest it on the
MS-7E61.

Thanks,
Tomasz

[1] https://lore.kernel.org/linux-hwmon/20261107154225.325003-1-tomasz@bojanowski.me/
