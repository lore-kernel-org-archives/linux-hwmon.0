Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB52340295;
	Mon, 23 Feb 2026 18:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873130; cv=none; b=qlNIQtGKxB4p4NIi7vJXkKWwXpc3xESkzOTtQakOeAP1sulnjugt41Yej4fvwKiB4Zxfwy5xoGVqFbXlOAV3QyAOI+1BBX4eHdkQcONHxJq4fTTay4ZWgDzZN68Pwr0IQAyo4QFf/ypbauD8zxWUO3zR5+43wjO9Wehcn4EwR8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873130; c=relaxed/simple;
	bh=/M4K1voWTeSvniMWpMcE10fuedLEnuF5+VfhUKRzz/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0Ay2Ttbzk2KeD7rvTgo4QURJWUaT/43p/Ps9nKO2aES2ZSKhTGdr5FO80qljR/giqoc62jueSEYCgC/tyDW1cp3v3EE5taq60Q3QvWJT+G6EP92E8MdT9zRAGR6JlEdSsYrD/w9jxol6fR3TblbF00RenPnEZbHOZEUSRppMvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8Lr3lEZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8Lr3lEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38BF4C116C6;
	Mon, 23 Feb 2026 18:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771873130;
	bh=/M4K1voWTeSvniMWpMcE10fuedLEnuF5+VfhUKRzz/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z8Lr3lEZtWaAcM3rx199vaEgTmTE356rSx++i7m0YBuLmaJ+kFfzS1txNYc96XTiP
	 cgI8WmKFZ8eysVkrvTJ02eMHn/fwPdNjv+LqJiqexNWehZ/TlR8MWQnSKsS3SoX5PO
	 fptRftYW95UaH4B5l0kwBaO6E+ElNqibxRKd7v8L7lbFbDcaE6O4T6fX4r+ejnfjAk
	 blOjlOqbmII654SOUnYoWWiEhZzQpLw6D6Y510NqeiCsJjJo6SOi9E+7KzQ4rNpX/S
	 7z2od8HUWcZbJ31RhngjbePrVPTz9boTtxoYNl4bi3NJZ25jJuru9Hu+NOY6/E+GQr
	 Q0yB/igMUr6kg==
Date: Mon, 23 Feb 2026 12:58:49 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor+dt@kernel.org>,
	linux-doc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/1] hwmon (bt1-pvt) Remove not-going-to-be-supported
 code for Baikal SoC
Message-ID: <177187312888.163791.17055892428282367377.robh@kernel.org>
References: <20260220143611.2401353-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220143611.2401353-1-andriy.shevchenko@linux.intel.com>


On Fri, 20 Feb 2026 15:36:11 +0100, Andy Shevchenko wrote:
> As noticed in the discussion [1] the Baikal SoC and platforms
> are not going to be finalized, hence remove stale code.
> 
> Link: https://lore.kernel.org/lkml/22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org/ [1]
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  .../bindings/hwmon/baikal,bt1-pvt.yaml        |  105 --
>  Documentation/hwmon/bt1-pvt.rst               |  117 --
>  Documentation/hwmon/index.rst                 |    1 -
>  drivers/hwmon/Kconfig                         |   26 -
>  drivers/hwmon/Makefile                        |    1 -
>  drivers/hwmon/bt1-pvt.c                       | 1171 -----------------
>  drivers/hwmon/bt1-pvt.h                       |  247 ----
>  7 files changed, 1668 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/baikal,bt1-pvt.yaml
>  delete mode 100644 Documentation/hwmon/bt1-pvt.rst
>  delete mode 100644 drivers/hwmon/bt1-pvt.c
>  delete mode 100644 drivers/hwmon/bt1-pvt.h
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

