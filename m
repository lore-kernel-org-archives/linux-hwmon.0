Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6D81DDA3C
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Feb 2025 03:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739332514; cv=none; b=W8t875B9LatYbBOB/eeR0YTJ9Cow17swKzZFtW+RgVFwW6gTxsyun+fwR1E7c5xmzwKetgxY4NahUUBJ9HetS4+jKULBSiTiMkgjFUpqQvNtVv4KUm9aAygqgYzAiMUCKrCr0ix6ZlCmkDfabbKkDkwVhPW6z1a7MZ4vZXuGaHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739332514; c=relaxed/simple;
	bh=ki/rBHIwEnkGo4+EQ0nF0VwHrZ+PPRea/cpMhMPn/EI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQciPtg5B7ijamwZoQTIJVdin5sj6Xzc9hKJMp6MO1w8YX+7MpNGpVHhCSJFYS+JaWTccMR8BkIVZdq+im8MiIBI1lHpIz53OEM+K0fCj7gLJyvGenla4bsTOFbQhXXpcPMr4ZOYB5p2iJuxTjVKzcEZ1PQiEWlbsH6nReny8R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwfnoutC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwfnoutC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10DE1C4CEDF;
	Wed, 12 Feb 2025 03:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739332513;
	bh=ki/rBHIwEnkGo4+EQ0nF0VwHrZ+PPRea/cpMhMPn/EI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwfnoutC0LiqafriMR5y2meGhPoiuA7r6nvxiFOza2PBtE+2HsjtYZkT9wneiKnmN
	 XcyQxzUtshD/9uWceOIxA1HwM5nbB8Qbx9RPWBNDUa5QI+4Nje3r6UOetHxy+I3EF9
	 luih5fQzLCzvFKj19T9zQocktZZ40gdaB6pkSw/OHJE2chgEWqFHeyQsI06Yh7p4ux
	 uGmQatknJFD/a2z/tUECx3F2WVX4+vC3sL0EyOTRiTkBybDeaAcwxS5oiuMnkzFVIo
	 ud85gjtQfLRlGxNxDTvPaIiEsnb/+xd+GX6TdEqG4r4N6CcwRjGcQmb8CpQSRkiWjS
	 Rz8omA1Wj1iwQ==
Date: Wed, 12 Feb 2025 03:55:10 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 8/8] hwmon: (pmbus/core) Report content of CAPABILITY
 register in debugfs
Message-ID: <Z6wbnoV_Pb0uvTlh@google.com>
References: <20250211155240.2077464-1-linux@roeck-us.net>
 <20250211155240.2077464-9-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211155240.2077464-9-linux@roeck-us.net>

On Tue, Feb 11, 2025 at 07:52:40AM -0800, Guenter Roeck wrote:
> Report the value of the CAPABILITY register in debugfs if supported.
> Only check if the register is supported if PMBUS_NO_CAPABILITY
> is not set.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
