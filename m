Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA174134B6
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 05:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721713066; cv=none; b=BUDJhJbQIgMxDkTB38lD0utyluBTDYrc6S3Hpn/D64XqB0g9GndKTi/9LVTYmRFksL8jLQWA27pzqJ5155bYU2bcEBzWxBE3xXXm/OoPjwnaIygMaJMfwBtzfR/J4IHVFRdQSdWbNlVbBdxftjYBKYbUzNbPCGikjokNG4WtG6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721713066; c=relaxed/simple;
	bh=AFw/BFfUzD0NhaVhNZ/+r3LtTFPSi+AH6LJs2NZvSwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQd9zWHYk9v3RinBrl7kXHv8X/Au9QLE2fBrsUF35r/N0FB74ORseRElrjVeF7pDUPuPcMQ/hYgcREIG6Qj2jG5zn0uLpHcfvO0Vqod7hhKifalAM+rVr6LHrte7wyHFaEptSw64WfJXjtvoLl+TsJqZ9AASS1NrHem5cP60PNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=InK5UF9+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="InK5UF9+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6C9C4AF09;
	Tue, 23 Jul 2024 05:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721713066;
	bh=AFw/BFfUzD0NhaVhNZ/+r3LtTFPSi+AH6LJs2NZvSwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=InK5UF9+MDPGtOKZr/hGymA8s5eQPZRV5f244LVs7yLyG0+I+zDoAnex748aD1X2g
	 DWvxxvd4ov1oGr0NXZAUDLzzzlET0LZtwa71IgnUM1/BPjygaXnvl9ZfFwbIX34RhX
	 C8NE6Tm+CT5ZdbwXyxr4/+5ctKyO+rAkdpcwjXm81ne4007Itn6qirzyOmCkWNrFij
	 icN4j34ma9wOm+L8l8M0loCNj3/XWFIO4OFSzPN2jbnbTNtxsEcrX7RA1UFF3Jzwya
	 BwyiufCOImlCcb2sfX1z0l1VlJWoRKPq42Obnr/oSHNuluaFbt2W8JDx0pH+IqRRsx
	 R71jLC8RnfIUA==
Date: Tue, 23 Jul 2024 05:37:44 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 5/6] hwmon: (max6697) Convert to with_info hwmon API
Message-ID: <Zp9BqDz35aPxPkz5@google.com>
References: <20240723005204.1356501-1-linux@roeck-us.net>
 <20240723005204.1356501-6-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723005204.1356501-6-linux@roeck-us.net>

On Mon, Jul 22, 2024 at 05:52:03PM -0700, Guenter Roeck wrote:
> Convert to with_info hwmon API to simplify the code and reduce its size.
> 
> This patch reduces object file size by approximately 25%.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
