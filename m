Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936D07407A
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 16:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721320838; cv=none; b=RU1gWK+Y+RUVmfylwA8V9p5IVZHQqmwclZ700Y6KuXhNJoK5rFNGx82RGvEjtYbJVdwV5WB/M0cd+ubL3bIsX91yuUmlxp51rlRCP5w9Rs3L6f9NV81SoBBK7hMXcmzNZdcnbFj1CYczgxo3ZAgVhRrMXhzZ+7if81piUHcH/Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721320838; c=relaxed/simple;
	bh=4Jxbo91j/E55dD00zJfivBDpfwjT8cui2wLmgDZsQTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JVwMhm1w5Rhur27UwI3euJ/4uTJ0pULtl4FZFTF55s6Z30mjpb/bMen3XUbaYTagntl1W16aH9zNwejH4ur0eX/OBajRtoBVNZcYlghGipg3/exKc3nwXRJ1lBW2pHmGZ2LAQpC9n+8bWnLB7Mhlfqxn0fXj7i28RiCZhsLXuhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdWNHx4i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdWNHx4i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74605C116B1;
	Thu, 18 Jul 2024 16:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721320838;
	bh=4Jxbo91j/E55dD00zJfivBDpfwjT8cui2wLmgDZsQTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IdWNHx4ibvTfKNpxwcS3d97DwdGWelvRUoLLqt8aHhQhFSXg3ONeFiNdAlwPDNAii
	 CNykHc1nXCcCt45K+bNPTRyRvACOMgvLAfCmR0KKL0repHZYzyRrvAcV1+KMtnCTts
	 +p0dD3HmrA346m+Q+5QjQ1XB30MKzjcuBqYVPTR+NMvjhgRe65WT4frCbOu6abRAiK
	 RsXKQ1Wg2pBHC2pewNsdSrAf+FrcNhId7crb6Rwvcx5JVChJSQ4I6QZukvHZ5gNCUY
	 UJX8uBW56B7P8gEpRo7whBTk4fijgeV2FeI6/08sV0ZlN8f1DkqwS2zc16hecMhojy
	 q3o+QJFpU4RJw==
Date: Fri, 19 Jul 2024 00:40:34 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 5/6] hwmon: (lm95234) Add support for tempX_enable
 attribute
Message-ID: <ZplFgnjEhNKURkT6@tzungbi-laptop>
References: <20240718033935.205185-1-linux@roeck-us.net>
 <20240718033935.205185-6-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718033935.205185-6-linux@roeck-us.net>

On Wed, Jul 17, 2024 at 08:39:34PM -0700, Guenter Roeck wrote:
> LM95233/LM95234 support enabling temperature channels one by one.
> Add support for tempX_enable attribute to be able to use that
> functionality.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
