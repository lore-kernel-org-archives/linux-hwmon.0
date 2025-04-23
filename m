Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D86979D0
	for <linux-hwmon@vger.kernel.org>; Wed, 23 Apr 2025 01:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745370469; cv=none; b=ulsrsOKkswPUcr2TU/Mxy34eJlpIB8UoUSR8+M3CmKZPuPB5qBXgUAtUw+fvfrcBRYIgxBuobV/3A8abJC1vXoNV3BQGayntGOrCxp7ykatlbFydlzZdhrQGn28mZIHTtGrE6rx7kj+AdqP2RYZOp3HApmZgwnCjeyDhDjNlex4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745370469; c=relaxed/simple;
	bh=EH6gC6WN+YDOF5hM28T/1Da2S+2iBPegEYTcU9jglw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKbl7fiuGor+WFShmPmEqz9wMt80A5u4iQ4l+su7Lh4eU32CSS/g4ueUDK/8+sH4JTOvbdZtiUpYPbFJzPNRlwar+Y2YA9TNjeNSRwT/RpMQXXKj5UdD665k9MLdmMpubj0w1k4H4yq86wcMvPHeh1u6yLyc1joONT2FXh3f4k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ppsq3ZRS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ppsq3ZRS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE928C4CEE9;
	Wed, 23 Apr 2025 01:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745370468;
	bh=EH6gC6WN+YDOF5hM28T/1Da2S+2iBPegEYTcU9jglw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ppsq3ZRSAh3cILWAZf94HCC/9jU1TZq0K4jMqhsuUlA3nA8HINhx8it5XDIUikgWA
	 63HX/6QcjoBupirtZlOCUyYpIshD0cMmr/tSa1Dib/re45fcaKdRsIctsP5od84Hiu
	 6vva6R38mJBW61+mWa4YDeg7rJl3OwrLEFRWckpTFeVe1Q1xyNwjnZ2r8XloGrecef
	 JW5qruybTAj/+iXDkh+VBebtkBcfgwkyPdbA3ATOn5MFflC2+p5nep2pMQqlG+V/US
	 cfDJ8IVnsXlciYESnbg8452fgB64aIPBvaQAHlM6GdRjbL7wLIqW2+Bechhz5iGbBA
	 iYIMwFpO3FmhQ==
Date: Wed, 23 Apr 2025 01:07:45 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
	Jean Delvare <jdelvare@suse.com>, kernel test robot <lkp@intel.com>,
	Johannes Cornelis Draaijer <jcdra1@gmail.com>
Subject: Re: [PATCH] hwmon: (aht10) Drop doctype annotations from static
 functions
Message-ID: <aAg9Yf0F3nomKixJ@google.com>
References: <20250416230214.2016863-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416230214.2016863-1-linux@roeck-us.net>

On Wed, Apr 16, 2025 at 04:02:14PM -0700, Guenter Roeck wrote:
> doctype annotations of static functions have little if any value.
> Drop them to silence 0-day complaints.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504161919.duDL1s2X-lkp@intel.com/
> Cc: Johannes Cornelis Draaijer <jcdra1@gmail.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
