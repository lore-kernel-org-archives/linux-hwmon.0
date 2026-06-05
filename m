Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EAD224234;
	Fri,  5 Jun 2026 04:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780634181; cv=none; b=ttWv85xjYSpqGJKaPeX6t4oSnNlBJulG+EW79aw4eMsVdpVNRzg7ylWNewrfx/aMiuIZK8cegbxeW5uVWbxYv3RREkJOLwzBJUu0j3br70+N5ta0qTGnpmPocbO+qLKn7yk8Vp5NFTwzBloHH7savVV4nqMWKJpXoIssz2PiONU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780634181; c=relaxed/simple;
	bh=oxduxq9szg4PERgzx+80PHE84fuVUetm7puv7+IDhbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqgn2qrmrRJlEOQCbqVxRH/sHDP5oze3wiX5A/s/G7mmg8H9xstxRX2d0ZqtSaMhfvG3dbzFcByDAj6k5vhPi5REuNKr5xaCm40W7cdvJOvfDVim2WqwZA/99BCGrUZePZ/xK8z2MqgsSU6elLKSgrV5qYGhLqWZO8vQ4Van80U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VG16cajz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VG16cajz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=8yg29xdfWEix29X7YVI5IhW6C7s2qrb4kLGfBOiza4w=; b=VG16cajz50ByIGB0wS4MuR43n1
	F54JyWb6zi5Fvo22iwAx4s09ss7fhwiPdzlmmqU4Cm0TZHHkld6fipejjJBneTWZSk5Kjt9Ryxjg0
	vg9HPuGsMycJWyX8h505+WGLsuXrOuZy2ObFoa7Esr28n+XkSpThmtUoJAvAt1JtDGbmgKWR8LD9M
	dXJkGOpojRsOCDI3uP6afLPUvYF230Bo9YP54SJFiBKAGcZ5ZdmXp/l8DSeKEBL0HgKbBes7uJ3jS
	oJ8EkkPLLqrLQFsfFF5IneKZWg+GZTiw8zcqDiHeIxEguE9X5QWrgjHl+Sn/BdCQQj/U9HQAqb6Uq
	J3VUnSwQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVMI4-000000004i1-4AW6;
	Fri, 05 Jun 2026 04:36:17 +0000
Message-ID: <e0193699-e5b2-4400-b55e-5dd0bd62b16a@infradead.org>
Date: Thu, 4 Jun 2026 21:36:16 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hwmon: Add documentation for SQ24860
To: Ziming Zhu <zmzhu0630@163.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Ziming Zhu <ziming.zhu@silergycorp.com>
References: <20260605020450.89638-1-zmzhu0630@163.com>
 <20260605020450.89638-4-zmzhu0630@163.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260605020450.89638-4-zmzhu0630@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/4/26 7:04 PM, Ziming Zhu wrote:
> From: Ziming Zhu <ziming.zhu@silergycorp.com>
> 
> Document the supported sysfs attributes for the Silergy SQ24860 PMBus
> hwmon driver.
> 
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>
> ---
>  Documentation/hwmon/index.rst   |  1 +
>  Documentation/hwmon/sq24860.rst | 96 +++++++++++++++++++++++++++++++++
>  2 files changed, 97 insertions(+)
>  create mode 100644 Documentation/hwmon/sq24860.rst
> 

Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy
