Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96BB23BD17;
	Mon,  8 Jun 2026 10:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780915647; cv=none; b=IM/A4GJI6TcGjNFAEZ90DjelQguRt/uwXLDPrjEedReXNxBPmw+litzE1Ihs/OoPWAzLZ/b8JUYfbBcW8EVpTl+YbExYx4YcNTgnfxN+obQQ9Yr6ikS4UzM7XCLyde/fQvTfQ0uZZEwMqY/DwGgElAEpUNoA0TH/S44qbFQkaFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780915647; c=relaxed/simple;
	bh=3LJI14/oTGPdDbY/+l/drcqvf5x9dKCf/iw9hnDp/P0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ev+2STtUIstcjDT9bncMLnS9fHi28KFCP59G9zFls6LhqDoNXol9NSQh8s/7eu4msxaY8LTa5Alba72aakVqwpnftH7c+ntYZbGPlXQEkQt3PX8raPqoanKUh6cVI+CSyBmJdc5LSJ3HmH6NxyKQTqhwTkkb3xUd/Cs/t6JvnaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzoGf9cw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzoGf9cw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581D61F00893;
	Mon,  8 Jun 2026 10:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780915646;
	bh=fSxp9tsKBtq0Ur2KMS40JrgZVEMuE+V13M00qcZGgDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dzoGf9cwSnGlvLzqm4lLQZbmkl/r7xoTtz8Me/aHRsMbKbb64zliXhkbHgnhQhSSo
	 3MYZy1Dg8l3t06xZQQNYZcZjvSwiM8ISdvHsLuDjjEw9o8XUftOAjnMzQwsHL4o/m9
	 9HW29iaiQNLSXa6pNAKlPIC81M4o3DREjILo1E8CEwj3rnH+25/QGYNZ2Zlf9a+XVg
	 NllC2rCUnzWFJKT8vPXusl4SCJLuL0HbJeJDh5IiOt77R+uDStL+1oGvayaMMJh94P
	 MMBodhCG6xa3sbzH7K380jBh/OWLCa63CBTi9bD/dKVj0DU1gOo4WielDmENgQG76W
	 6wou5g8FD/ucQ==
Date: Mon, 8 Jun 2026 12:47:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ziming Zhu <zmzhu0630@163.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Ziming Zhu <ziming.zhu@silergycorp.com>
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: pmbus: Add bindings for Silergy
 SQ24860
Message-ID: <20260608-sensible-cyber-shark-6fffd0@quoll>
References: <20260605020450.89638-1-zmzhu0630@163.com>
 <20260605020450.89638-2-zmzhu0630@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260605020450.89638-2-zmzhu0630@163.com>

On Fri, Jun 05, 2026 at 10:04:48AM +0800, Ziming Zhu wrote:
> From: Ziming Zhu <ziming.zhu@silergycorp.com>
> 
> Add devicetree binding documentation for the Silergy SQ24860 eFuse.
> 
> The device is a PMBus hardware monitoring device which reports voltage,
> current, power, and temperature telemetry. The board-specific IMON
> resistor value is described with silergy,rimon-micro-ohms.

How many versions are you planning to send on the same day?

Best regards,
Krzysztof

