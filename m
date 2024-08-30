Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213BC19ABCE
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 12:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725020948; cv=none; b=SzPxJdkh9Yso3vycdKW7PHM0X1sNAOBbO7gVzpcMU5tbJxs3V5pN/D6rCzTPsFi99jatIMxtSM6R6kFiONvE38iC84qzaRPRxeXTCUBUESIqei/vLm5CPx6F6WXT6SIt1XznISWJPuBosby260yt59VdpCmPvFmNeqqHkgssWR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725020948; c=relaxed/simple;
	bh=9j402jse+96YCvsFVgBy1ZvLiDMDheNWpXQWaYUGtNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jw1xbmjuS+FLZmY28kUM/vPXYOWCNdst6EDd47+bOeYNFTSMhC2NDe5ciF93kQUztfqJ0NgfsNHK/nvN1vVpA+sYlZoJkf3UBXo8daRZF2aUXbrZimHSwyKQsmHGEehK+WLsiSeX3JshFEng15LeflR++zRNgVIRojZytopfrCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGd/tuaD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGd/tuaD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07698C4CEC6;
	Fri, 30 Aug 2024 12:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725020947;
	bh=9j402jse+96YCvsFVgBy1ZvLiDMDheNWpXQWaYUGtNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGd/tuaDmZ/7KKn4bf6pgjsNK8bF3iRCqU/hSV8251Y1loVkTxwMZFnsZiV0/O1bK
	 l2HBtK43vL71rM4ow2GrngoJE88jC3A1lqZ0GSvdpoFqTKHX0OqojZ1cZ8q13vAw3O
	 45y+qO+XnNmcAQFQ+44s2SjFeDRBb8dFZgP2R3VIQ2BVAXdLyteChACwCbQ1N3U9A7
	 9t7KIWYsp3hCTyLQy43t94x1LkCyS92YdeTyX94sgMPIzYvL23qjSJKqYOvhFIIw8F
	 BUdByFKa63bBw4xwncKf2PQOoOL3srgIwyK9LHVtr3k7fQcE+inkF3Ow/KJpCtBi/8
	 DK5jOBM5hAG2g==
Date: Fri, 30 Aug 2024 20:29:04 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 06/14] hwmon: (ina2xx) Re-initialize chip using regmap
 functions
Message-ID: <ZtG7ECmqd73ECLQO@tzungbi-laptop>
References: <20240830010554.1462861-1-linux@roeck-us.net>
 <20240830010554.1462861-7-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830010554.1462861-7-linux@roeck-us.net>

On Thu, Aug 29, 2024 at 06:05:46PM -0700, Guenter Roeck wrote:
> If it is necessary to re-initialize the chip, for example because
> it has been power cycled, use regmap functions to update register
> contents. This ensures that all registers, including the configuration
> register and alert registers, are updated to previously configured
> values without having to locally cache everything.
> 
> [...]
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
