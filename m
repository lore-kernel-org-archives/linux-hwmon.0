Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BCC3E3C4D;
	Thu, 24 Sep 2026 22:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790288596; cv=none; b=ctzkpqC/OH6iwc5sOXxUuFp7Ev4kP71j9e/hwquYolr2PmZFpj3gFtSVNBL6C/aUHtQTqp/O2EQSx5BMFFjAAMIcLafFSXZ75RrWngPHZP4FzOB6Z7fF5NOnndQdEI/1QUylIFBIQTBG4p3TymUHCvfrp5U7No3eID9JceZUGf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790288596; c=relaxed/simple;
	bh=S3x+sHQcWFhpaUKhu81za+fz80tZxfatOBojCqrJDzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fyJ9106JGpllx9/OTSd6Vi3VP3vA9/NkSUhE+cOaRbVBUlOxPUVNCy+CqFRVC20MiKyoyVp/IYOc2Svp4nAxKM4RJowyOmwG5P5gPv+rGfNUboQt9PF5Nz404Wie++cgNrf4XMyTPDlGZUhogQ8tlc5iaQYSJh8seiLMVejdJNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g92dkVu1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g92dkVu1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8981F000FF;
	Thu, 24 Sep 2026 22:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790288594;
	bh=mFUL/f9Inmg2xJQE97ITP8b/GlvetqpoJPMk0QqhSlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g92dkVu13EtNuuVaqVSa1Y4o3fYAzFYUwxDVxAvGzbSVBYULEVAIxe1jpAJ31ojfk
	 TuHJ+Rz26vtH4YoUOioO8apijH+kr/0wmOsItxGQLpZJ5LYWgI3Z+5Tl2Hy5K9wN4K
	 4dFQHCMMNoxIFoWTFDI4ZpFVSo/0kOZJzfaBDSpawUfeEPYsv+J14zX6SY1zWpag9x
	 faNED8r87NiN6llI4sRht2X0zjmIoOXW3dDHYIr6ACrNbgIyK+xoyEWVPQBMcFgy6l
	 9d4kFBgqJy8r5Z+26KYxPq60dQWzudHjwsvsl9zxwiNU0Ie06uNaM/Yp6gkL6ds/Qs
	 71bSTAWJxoHkQ==
Date: Thu, 24 Sep 2026 17:23:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Quchaosheng <quchaosheng000406@163.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm: vexpress: drop the obsolete hwmon
 and regulator text files
Message-ID: <179028859209.2061232.10536474709345982702.robh@kernel.org>
References: <20260917115818.540344-2-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917115818.540344-2-quchaosheng000406@163.com>


On Thu, 17 Sep 2026 19:58:18 +0800, Quchaosheng wrote:
> Documentation/devicetree/bindings/hwmon/vexpress.txt describes the
> arm,vexpress-volt, -amp, -temp, -power and -energy sensors, and
> Documentation/devicetree/bindings/regulator/vexpress.txt describes the
> arm,vexpress-volt regulator.
> 
> Both restate what arm/vexpress-config.yaml already documents: the same
> compatibles, the arm,vexpress-sysreg,func property and the label property.
> The regulator node refers to regulator.yaml, which covers the generic
> regulator properties the second file lists, and all 13 in-tree
> arm,vexpress-volt nodes set both of the properties it calls required.
> 
> One sentence in the regulator file is not a restatement: it says that a
> supply without regulator-min-microvolt and regulator-max-microvolt is
> treated as fixed. vexpress_regulator_probe() implements that by selecting
> vexpress_regulator_ops_ro when the two properties do not both define a
> range. Move the note into the regulator node description in the schema,
> so that removing the file does not lose it.
> 
> Nothing else refers to the two files. Remove them.
> 
> Assisted-by: LLM
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
> ---
>  .../bindings/arm/vexpress-config.yaml         |  4 +++
>  .../devicetree/bindings/hwmon/vexpress.txt    | 23 -------------
>  .../bindings/regulator/vexpress.txt           | 32 -------------------
>  3 files changed, 4 insertions(+), 55 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/vexpress.txt
>  delete mode 100644 Documentation/devicetree/bindings/regulator/vexpress.txt
> 

Applied, thanks!

