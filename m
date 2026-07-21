Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2935347A0C2
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 11:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784634755; cv=none; b=hWofGwVnP+odfH4ZFMLgX3+7swCFmUQ8i36bVT8Ewb5a0x7W8d8YH5y+wbLZxSP5W8E247kLqBa//SGR/MnHv7yt1S/Mb+l4ZO2GpjtztloWbSVkOXx06nrccW3vLqXNnzPHQ9tlRTWuc4JjdL9KEhTtO0fEq0gl5UfNR3YLvQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784634755; c=relaxed/simple;
	bh=jfeNo9sY+CV+61r2cYiAL9DDVOqrE8w2PYAqnuzcsKI=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version:Content-Disposition; b=AOvVZzYjD58mfqJTzXUQXLO9Dd+f4sr2ulhOZVgTlLNBAUasMkIzN4cRiT+/PRrAaKVOMcvL0heKF48KB3rN4EK2GM7+ohjNl0I9e4PuFO9eZq9N3HpN1x14iOY42wLrj+hMes9CE2wgZtrIcJ/FbI1U1b8BHyFN1Ak2quTR28Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Q26gUfo1; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Q26gUfo1"
Content-Type: text/plain; charset=UTF-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784634742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=saPQNRXNr4uVjroUD0Lw5F38mIc84uTGGZFC3b1RqYo=;
	b=Q26gUfo1WQCFaXMCnKGGdL3LL9K4urpBsFjjlc8rJ2iknWOPf2bp22QYMRWaK19H8IrSso
	LI2cvDmA01yHI79tJaqXq5/a5/BHbimUbvxgO+l1+pDDVG95y9Sf5BHpuTZt5NDRn6Aefp
	D8N83wAXa7XK81tCXohhDc7Q4E/9C50=
Date: Tue, 21 Jul 2026 04:52:12 -0700
Message-Id: <DK487PYQKFZK.HX96HW3B22XZ@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 4/6] hwmon: (lm63) Add Sensylink CTF2301 support
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
	<20260721-ctl2301-v2-4-ef5fb342872a@linux.dev>
	<20260721100004.D93AC1F000E9@smtp.kernel.org>
In-Reply-To: <20260721100004.D93AC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mutt-References: <20260721100004.D93AC1F000E9@smtp.kernel.org>
X-Mutt-Fcc: =Sent
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 21, 2026 at 10:00:04AM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Will this corrupt the temperature reading if the I2C read fails?
>
> In lm63_update_device(), if i2c_smbus_read_byte_data() for the LSB returns
> a negative error code (such as -EIO), it gets bitwise-ORed with the shifted
> MSB. The negative s32 error code would sign-extend, overwriting the MSB
> bits entirely and resulting in a large negative temperature spike instead
> of propagating the error or maintaining the previous valid reading.
>
> Could we check the return value of i2c_smbus_read_byte_data() before
> merging it into temp1_input and temp1_max?

Good catch. A failed read must not be combined with the other temperature
byte. I will read both bytes into temporary integers, check both return
values, and update the cached 12-bit value only after both reads succeed.

The existing lm63_update_device() also truncates or combines unchecked
i2c_smbus_read_byte_data() results in several other paths. I will address
those existing error-handling issues in a separate patch, rather than mix
that broader change into the CTF2301 support patch.

                                            - Troy
