Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CD531E820;
	Mon, 27 Jul 2026 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143232; cv=none; b=eJ1plY2sgz4ZmT7k3aI/RiFTcCyONlQkRvTdcTNa8S3FYq/YgMAP3J2FkWfxeteMW5NSOkV9SCmcFFihGaNqcAuQt5+sPkSNwI5w+rdj1Wn6BTRYwPRNlukMwYIwFEuTnU83ii0cYzLc7/NMxjWDg2XuneGdViwlG6llu5LrHUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143232; c=relaxed/simple;
	bh=oOzv9STeYiNA+al6m1DSB2JFlQOMavURRDoBppDc5Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXQY1/WANF3P0PswjDYGomsjZ9Em6RXaU97wIr05240/bcfzYwkfIPt9afN2kbWgR8W9Um37br/CHgnIB+P0iXiVEk2EoUbEYgUFAYb+xecNRMH63IXavrWzxRR3AOHE20CCeozt3XUxPW3z+Tu1WnMVdT3vaZgY2obaEZvCl04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IAfqTkrZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IAfqTkrZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633F01F000E9;
	Mon, 27 Jul 2026 09:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785143231;
	bh=47OcSGHqYNsZ+zLEFQ0Nx9/aS1Vdcnvn7RHzq7+qcM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IAfqTkrZKstX75hF+WJdqBDJYaj3tO4iiynYcY+36mAXWDw6eAO5kDsFQES/Zba30
	 HybI5Nu5EgfVAS5OxyCp90M4142EfAxN1iP/V6xIb/c4tcYo/Duq1LBloFAyEnuo5C
	 CqsWyEXjeqmpJ1XKSG1jUsjoDdPg1R0pCSdHu+pe15mvvLuSYS9Zuz/+xGmnIBFoxF
	 sKMaqfsyf3mDdL/eOJsY6Nsj0L8Nu80hJIYdJnneJycj25nowvnimOc6PbDU9Vrv4z
	 rpGi/xLNkwqA5Fs3SBxjPHv0rUfbf4VjGzIdGksOoo2Uw+0a7U74xCFqrI7wwbKjVx
	 2khAmHll/c65g==
Date: Mon, 27 Jul 2026 11:07:07 +0200
From: "krzk@kernel.org" <krzk@kernel.org>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, 
	"linux@roeck-us.net" <linux@roeck-us.net>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"corbet@lwn.net" <corbet@lwn.net>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sanman Pradhan <psanman@juniper.net>, 
	Debjit Ghosh <dghosh@juniper.net>, Jawahar Balaji Thirumalaisamy <jawaharb@juniper.net>, 
	Santhanakrishnan Balraj <sbalraj@juniper.net>, Brian Mak <makb@juniper.net>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Message-ID: <20260727-stoic-marble-gazelle-732aa6@quoll>
References: <20260725211945.288415-1-sanman.pradhan@hpe.com>
 <20260725211945.288415-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260725211945.288415-2-sanman.pradhan@hpe.com>

On Sat, Jul 25, 2026 at 09:20:06PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> Add device tree binding documentation for the Analog Devices MAX16545 and
> MAX16550, and the Volterra VT7505 PMBus controllers.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> ---
> Changes in v4:
> - Add an upper bound (maximum) to adi,rload-ohms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

