Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1CC3B52E1;
	Thu, 30 Jul 2026 06:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394578; cv=none; b=FH1nHHhAVniY3FSnYLMQIiUMhzXeUKmjqNRlOt0wDXX+2iV+CyyEyw2+pb+8OiYuJFNmNhIK6u+VZ8DP/leQLlkPwsqfmH4PdNt05nSx1ky4G8XhKRUnochYABLs4uT9m0tiBm6eUVk1M8kOQpjVi+x+0qZlUsfFviT9bz01Jak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394578; c=relaxed/simple;
	bh=N0Q20xcsT6sAisGEunQvQbOSX5UY4V8QKRtuYENnRh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgHvoqaQqqSF8Qt2LK0G8Fy11IIFoDITiO10QZmJFitUX6Wq/Fms8zYSAo5CtpDieucM4nmvhfuXV5MWVbMYVhjdSFiUmVDGVKBH/IRs6Ke4prdjnTGUwND4zelvaBc+WHVrr2v/o9QQAwUPckBSZgds9vBA0wwRPvLrBnYUUlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=C3hTgQx/; arc=none smtp.client-ip=212.27.42.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="C3hTgQx/"
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id EC25FDF86B5;
	Thu, 30 Jul 2026 08:56:00 +0200 (CEST)
Received: from L30177.local (unknown [81.201.198.134])
	(Authenticated sender: vjardin@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5BEBEB00563;
	Thu, 30 Jul 2026 08:55:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1785394553;
	bh=N0Q20xcsT6sAisGEunQvQbOSX5UY4V8QKRtuYENnRh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C3hTgQx/yI/p+TtjkZiM8hDtcdAQRjk31eI5S6lC5VXl96QDOK8j6n+W/R8vYQRm0
	 c4VM/ZUB94vdxGODGQc13I8NuKIQs0nD/6gpKOLwA2d7YG7pIp+1XusqP14CfpGat+
	 ae08vZgljs68U+pKCWwLeFQmPdChKHVyF3SdlSFTnf1Q6DhP4iglKfCWU7Dgo/xLuG
	 OCmNmariJmlftP2Y7E4m9S4g2UYDtjvt3GjeK2FVEANSbkG7XqmaxV8SnYVU1pRR+G
	 mbO0RADWfkMVuiPFx8a61EmnYygoKH2nhhahZIHuX9hXINYR5UvqEnXcKDX8NchxBN
	 iVrE/rtou0d1w==
Date: Thu, 30 Jul 2026 08:55:38 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 2/4] dt-bindings: hwmon: pmbus: add MPS MPQ8646
Message-ID: <amr1ar1eLeZ69oGY@L30177.local>
References: <20260729-mpq8646_v0-v6-0-98848151cdb4@free.fr>
 <20260729-mpq8646_v0-v6-2-98848151cdb4@free.fr>
 <44db442e-95c8-47f0-92b6-81279710ff33@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44db442e-95c8-47f0-92b6-81279710ff33@roeck-us.net>

Hi Guenter,

Le 29/07/26 21:10, Guenter Roeck a écrit :
> On 7/29/26 14:51, Vincent Jardin via B4 Relay wrote:
> > From: Vincent Jardin <vjardin@free.fr>
> > 
> > The MPS MPQ8646 PMBus step-down converter uses the same
> > mps,vout-fb-divider-ratio-permille property with the same constraints
> > (maximum 2047, default 706) as the mps,mpq8785, so add its compatible
> > to the existing schema.
> > 
> 
> The driver is a separate driver, making this a bit unusual.
> I'll leave it up to the devicetree maintainers to decide if
> this should be a new bindings file or not.

Because of Krzysztof's review of v5: he asked exactly for it
since mps,mpq8785.yaml already carries the same property, the same
constraints and the same defaults:

  see  https://lore.kernel.org/all/20260727-sceptical-finicky-waxbill-d7ecbf@quoll/
  "...Everything is the same as mps,mpq8785.yam, so why it cannot be added
  there? Just grow the list of if:then: to cover your specific
  constraints."

v5 had it as a separate mps,mpq8646.yaml file. I'll follow whatever
the DT maintainers prefer, but so should we consider that it complies
with Krzysztof's argument ?

Best regards,
  Vincent
