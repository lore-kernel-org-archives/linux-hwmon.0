Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AA318B0F;
	Fri, 26 Jun 2026 10:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782468362; cv=none; b=MyiZEG2BSoqX4cDUY/6phkEkayiVQ/1yQ9CS7IG0JbSchWNh0Gtht0Wds6tvFDjHi5wo1O6uJ8ggPAyrBAS0tUfzVxfD+tK7nA1BWHYohORecEo6WKvLG9oIibN9NacpWS6QLlKwpLjugQvJgmJsYEAvtW6OtY+mNQQoST182Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782468362; c=relaxed/simple;
	bh=rKmflEMbcMZIfVItGcgxoOJgLvnhrqPw2LKP5XZ6M/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkWDYZip+XVfuwUli7WzTy0B1c6v1rRknYJrIH/V3h3ntDSR3wfg6SasJKkP0nKOul2gOG/PzQjneMWXPJsCFLnS4YfhDugYv2UAGmk9xLl8RA+Ont8ogWCciVEZIPoGMy7TH4xvJhbU86rcJj/V03dDq4RVUtFqTQ2CIwXFnhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Htjfgtjl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Htjfgtjl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC391F00A3A;
	Fri, 26 Jun 2026 10:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782468361;
	bh=jcKh58iL8WIQzcHbsnUmBBybvD/z8aXyoKwE5jmOnqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HtjfgtjlM7MLRnsky5UjtpriqwNF7+wcettAJnB84XxsNRllXEmOPaqdSo3P8Khp0
	 Xt1cPeuTYrAw3+hniySXZJXtrJkIlVDO0JR72SJniQ2j/EF48SCsYmKkPTM8YpUGPF
	 u9XDrMBkTuxA/AJxMDinT25ToJ9ERYDEtcXqnYPTA/aS1/mgqKYaw/KaY1cWVHJ+w8
	 qhDwM/XtRRmxWRLTZmXp1isXXD1PaaxVwnfDI44YdOI964FAdePTuqB/oUKgqOhNuI
	 fT5Ui2hPNIiAI2qXkKn812koYbPO88oJZWlaY5+Aew8lhYYhfgsDq8USfY3IddhJWo
	 zL2wO5H8FR0Jw==
Date: Fri, 26 Jun 2026 12:05:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: chipcap2: Add label property
Message-ID: <20260626-prodigious-rottweiler-of-tolerance-cbeedb@quoll>
References: <20260625160423.17882-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260625160423.17882-1-flaviu.nistor@gmail.com>

On Thu, Jun 25, 2026 at 07:04:22PM +0300, Flaviu Nistor wrote:
> Add support for an optional label property similar to other hwmon devices.
> This allows, in case of boards with multiple CHIPCAP2 sensors, to assign
> distinct names to each instance.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
> Changes in v2:
> - Implement suggestion from Javier Carrasco as proposed by Krzysztof Kozlowski.
> - Link to v1: https://lore.kernel.org/all/20260622122200.14245-1-flaviu.nistor@gmail.com/
> 
>  .../devicetree/bindings/hwmon/amphenol,chipcap2.yaml        | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

