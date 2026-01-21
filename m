Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D462344DB74;
	Wed, 21 Jan 2026 09:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986482; cv=none; b=MjNr/sRFz6DQJbolIztrj4TMLT04Vg/jE+tKdVsPKIqSYHHMIPB7tvQWadwtPWza/HNi0jhNJUYihQsxLhv9Z+Did1xDSe18GNHzcH5GmlGTPUDR2ZdRjD1OxLnCo+YbD9lIKpDqYCratuRt5pv3bIU3ySwV/p+CKhM5bpoVp/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986482; c=relaxed/simple;
	bh=Pu2d+OgdSj8XXXCkcil4fTWGgGIYsuQhNfGKdThDnt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eeH8KZTMftasHDaSSUdKbPBwXixQCXj80377BlMUFVKrNZCod/yHvN70G8PL6isKYkcZIj/7xWSersHP3mqOMNWtZfOnKZdON32S3hV1te3dGToCyt0+YH9GIOtSvrqBs1dU8r4Iq1aFFM917un3ZSVBtVboJ+UvUwrLexD5Sbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sG5N8Vd9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sG5N8Vd9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9EEC16AAE;
	Wed, 21 Jan 2026 09:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768986481;
	bh=Pu2d+OgdSj8XXXCkcil4fTWGgGIYsuQhNfGKdThDnt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sG5N8Vd9e6Px++ARZL3K2X7/YmQD550luRXEV/a556I9NqlFQN2aB+yHvOs0fClk/
	 DTd7tJvr+Xz60T92CTX2LSNEBLDmndSfGgE9m5EYgPaNLZbYdXAuZHh8LyRY86Ab6T
	 E/hMDM2gVBOnW0ln0NrrffO8qdkMcL1H3ucZpwme7HAkNp2Pw4uaPgaeabVlTE+JYw
	 ZrWUSRqfgP9gYOAs1wKnpZ7Nyp5/qFkK8klAtfT/uzaiuN92BYrcAmh1tTVQAchWDM
	 voV0/Da57Rfy2FMPCtpp7Dq4zqFzpDzMFma9wpPlW/xnmxuWIAgmTmEErt1oGg9SoP
	 /77BJcEmu7p0w==
Date: Wed, 21 Jan 2026 09:07:56 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Stephen Horvath <s.horvath@outlook.com.au>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] hwmon: (cros_ec) Split up supported features in
 the documentation
Message-ID: <aXCXbKxoK-FBN8md@google.com>
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
 <20260118-cros_ec-hwmon-pwm-v2-1-77eb1709b031@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-cros_ec-hwmon-pwm-v2-1-77eb1709b031@weissschuh.net>

On Sun, Jan 18, 2026 at 10:45:55AM +0100, Thomas Weiﬂschuh wrote:
> The wall of text of supported features is hard to read and messy to
> extend. Split it into a definition list with an explanations for each
> supported feature.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
