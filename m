Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C3C1A7AE4
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 14:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724943333; cv=none; b=L3gUX/ygNPK8DqHexWXvf44hhT4txldmQfhuWutwc2HO+UkXiGo+wBmaj0Z1VNvf1cl7tC4ZtMbN/sBGJrNHgPj7ryRA/FtLLdiCwSqxs5brrJ8O1Q9aJ2mQ+ROv3dRPM59eAPQ5JLdQraOLzCD8bgoaxqFhQYZmuAopYy5dEPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724943333; c=relaxed/simple;
	bh=Ugwv4JSonhjQmQTbiHD0DnnXv/adNi+OitB4CxFvncs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMdV1/7oNAGleFMi5uvIkJJVakxA/mOMiHk5KTkRs04y9+NhminkF/r1GvrK69keeIGWZsIxthPKI0TzhreQoBVxuw0X311Nyrn9/dqZdR4JhVA7qqbj7qelqXI2IaO0iwO2PtD6M7TljeR46DnPh9cAfNfa3YCR63zZwVCHtfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcoZZ8aR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcoZZ8aR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DBFC4CEC1;
	Thu, 29 Aug 2024 14:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724943333;
	bh=Ugwv4JSonhjQmQTbiHD0DnnXv/adNi+OitB4CxFvncs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dcoZZ8aRI1ck1W8EXT7gp/QvAINxKVCJO1n6LGRt4EI8Xoi45fmj/jSdvx4OInNOa
	 XhnpEKNpOgZxPo6uuCguQywLMdOxyRToRVdtGucYTV9Q0QkInEJ2g/n1oe18xCFXk1
	 gltdBqO9oJsEbFnrTzr2dWYRDa4iEeE2mjUHGma2t/z98e2qqEy5iGNlWh3EsfvkmJ
	 c11Bd/PXnSM+ONlAwc+oSJuhbsKFJd1tb8lyuqtiMlBy8RVOHms3CXzNdnjW/30vWp
	 l2p/tElEhsXlmUhv00GWR2uFEH1Sv4SL/oi92kB4AX9W4AH7s7iAi9a90QUgm9QMzQ
	 RAkvUFXZ3z2fw==
Date: Thu, 29 Aug 2024 22:55:30 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 10/11] hwmon: (ina2xx) Move ina2xx_get_value()
Message-ID: <ZtCL4u90-VZXbdH-@tzungbi-laptop>
References: <20240827153455.1344529-1-linux@roeck-us.net>
 <20240827153455.1344529-11-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827153455.1344529-11-linux@roeck-us.net>

On Tue, Aug 27, 2024 at 08:34:54AM -0700, Guenter Roeck wrote:
> ina2xx_get_value() will be needed earlier in the next patch, so move it.
> No functional change.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
