Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899762;
	b=S7OShisnwkJ9Dv/SsUPODvrFLytWySZ1UvLfo9qd6BiDiZQlHfiro+BbE5mwRol6tseN
	 TxQ4mumq9QZfH6SHq3NU6sYytRuBHh596EZl9U5b6xai/1xy7mkneHL7qHcDeK3R6MoTb
	 iIHEauFRVooZk4VrbpNztxzTindhyvnex+drcaz5vTk7X6qem/hPgnIsfD5u99+oWjK6h
	 XvUFxidYb5AoukyP6piw/KZzyxk/F32y3Kk17VmUMpz81uXGo3LEuwDCxIqJn/ZrOGWEA
	 3VYkCUmOGY7h+8M/65Y00XrOOUWnvmWv+wXA5M4YllmiYsJtBXz55Ih7XLVwWaDa45w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899762;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=yfBHe/Ez3XdJO6ztZkf6F9mZ0258esYganc8C8foz2A=;
	b=gNBuYujilG7pYRIQB08QTko6OqXaGEMktsOWgrS71RDP8ayhVzts9HmtwSz+9R2sQ24n
	 7+Ics/EYTrsXekOb8xtxhdFm5TosGK34yDjWwYkyFYm7xKM0UJMvcxL4cpX86YnCbTEdI
	 2Q1olXAtC9W82+udGqX5nXFdagC6sJDYG9fsk8YAsZrDpdPOLSWCjmR6C1mOpaLITl8/e
	 wtnuauZ+KbYxeKdwGQvaFB8wsEVLn+nfS5U32VXYTkKcFrXIocNOXVo/ZSHnKJ50ywwAD
	 WpB86JvKbGVORp56qNi1yKWeHNGXgQzq1xS4MM7TUc5dAwTqOcwMO7NfzUcFJKh6iOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=GDx+uJy7;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723E6606A31C;
	Tue, 17 Nov 2026 07:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 723E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=GDx+uJy7
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jTGGx14rzz8vR4;
	Tue, 17 Nov 2026 08:15:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1794899753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yfBHe/Ez3XdJO6ztZkf6F9mZ0258esYganc8C8foz2A=;
	b=GDx+uJy7+Z+D/ikgx3+hXHo6pCf5AxVyU5KxbIcBkHFTIF0WTsP9U1LY64Xu0RCdJH1JZB
	4vQrjovW6Pr4T/sdQFu4FIjnZpMTww8RpGh1q0jdUXbKvENpVMdGsd+CC1DS7WHmYuGCcd
	Kxd26P6xC/3emI3F31cRPLwSy2sHXzAVNAtSH5u76WSG1EFG4KJ1x1o3WLnlJh6IdJtnBE
	s88veOhvWGTVuSZAsmz+ZShDiRCKEc9B7xJFGPAjF8W4UrgR3LWVmfTGokekf0jE8u7hM5
	UvOAMDbPoqxV98b6cDbRzDbxP5YdjGNwn7WOeIiiS9HNUtmWJkrCJg8i+TDTfA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Hamza Mahfooz <someguy@effective-light.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6683) Make pwmN_auto_channels_temp of NCT6687D-R writable
Date: Tue, 17 Nov 2026 08:15:49 +0100
Message-ID: <20261117071549.587435-1-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <982b217f-eb02-4d87-8e7c-0cb7e7c3a387@roeck-us.net>
References: <20261116232612.501586-1-tomasz@bojanowski.me> <982b217f-eb02-4d87-8e7c-0cb7e7c3a387@roeck-us.net>
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
X-Rspamd-Queue-Id: 4jTGGx14rzz8vR4

On 11/16/26 22:22, Guenter Roeck wrote:
> On 11/16/26 15:26, Tomasz Bojanowski wrote:
>> The attribute is writable if, when the driver is loaded, the curve uses
>> one such temperature. Before each write the driver checks that this is
>> still the case and returns -EIO otherwise, so that it does not overwrite
>> a source which could not be selected again.
>>
>
> Why -EIO (I/O error) ? I could imagine -EBUSY or maybe -EINVAL, but I don't
> see why this could be considered to be be an I/O error.

Agreed, this is not an I/O error. I followed the curve point attributes,
which return -EIO in the same situation. I will send v2 returning -EBUSY,
as the driver already does when pwmN is written in automatic mode.
