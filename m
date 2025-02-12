Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF271581F8
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Feb 2025 03:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739332500; cv=none; b=WVtW5kaUvQJUU1JKH2rkXMEZ6GRSYwxRGdBqb7mXhu49sj7LGom4xXtFD2Uk3pS3pjqM7dr80k6Yjx2gkDj1huImlbnbFMW/q8Bkhbo2rTrHPOdSzv+K+m4b9NcUEctykL+YyI7TXmprYJZDO2OXZtS9wOd6y+r0DuNWrmMXVZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739332500; c=relaxed/simple;
	bh=vcf0BvflBDt4dy3Xslu4ouuQDbNNwybtlIOiEwgL7m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHmB1Z0nTe2ByEN0MoxRwUY52Ox961sdVBe5JXgDfCszKgK5S7sB+8mKzMIXG9zUqvlnrILI/aXeMe/eyGB6uZ2DIqMBLSEAn5P4q5Cda9744jeHI4y2lez/NM/tnt4kt0rtpHrsPbeFs3ob+/XpbcVMBVs4lJZbGq+lhKwxrK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boRvpFZ5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boRvpFZ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918FAC4CEDF;
	Wed, 12 Feb 2025 03:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739332499;
	bh=vcf0BvflBDt4dy3Xslu4ouuQDbNNwybtlIOiEwgL7m4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=boRvpFZ5FSb9HSJud6WzKZdqMwcAl0ExLoI4Ft+tT0zfxKnMR+b5XPJWBEbFEAlIB
	 MDdZzllD0e17mHliZ/QUZ6UPk2vn9yZZRUOX6DZi7YyXpTYV55ECbrSv5e/EfGMSFp
	 WjFSY8zkECVs9DU59ZZgqSl88Nr2LHpYn8UkBsahvtP1gXMBmtTfdxY0gTKPE1s6ze
	 URWKGHuIqKrikTuvIGQwaahlgcRVv1FbU8oKwiWamnScuG8EwUm66uQuDrh/ulICgY
	 7CEy5JinT+j41KBw/QfD/wQ46lfqH5Ji8ErPPPIP5qLxyJKIj3vgL0vZths4sKTbPP
	 JR7lM0mtqYiig==
Date: Wed, 12 Feb 2025 03:54:56 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 7/8] hwmon: (pmbus/core) Optimize debugfs status
 attribute initialization
Message-ID: <Z6wbkLQlDaZuMVnd@google.com>
References: <20250211155240.2077464-1-linux@roeck-us.net>
 <20250211155240.2077464-8-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211155240.2077464-8-linux@roeck-us.net>

On Tue, Feb 11, 2025 at 07:52:39AM -0800, Guenter Roeck wrote:
> Define debugfs attributes used to access status registers in a data
> structure and loop through it instead of creating debugfs files
> one by one. This reduces code size and simplifies adding additional
> attributes if needed.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
