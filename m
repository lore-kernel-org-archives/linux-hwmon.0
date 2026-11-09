Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217243;
	b=MV9Km9rYPf9XZLnwuG0NMljJO+mjcIbAxsb8jdu1tOF8Dg/CoycHZbnBFjnLfgOW0ETI
	 Ktvhy7fDeNYoVhv87x5xA9350gesoXLW8QrxongzVfqnenKvPtZ29neBH5035wekGhf74
	 h4rD2PEA3KHscrfs2MaK4Nb+0R8E7MhemlqoCuXwpKnUsRQOa0rHni4/sIR7UAFI6rhas
	 iPGvngGQLQAdmP3nllUQVmTYkEUI84D80Q5NcwixRsAGc02oc2A9PfJW3F4QRB0c/1o13
	 FcS24NWFp+ylsyd7eiFoNTQYnS+niLEpFdQ+Rq+LD1A/lfOqRBd5P87s2ZEU92KF8Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217243;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2Lhf1oVBUzjNJ7L7ccHNHY1ZkhYM/kcm/f0+29KNaVA=;
	b=f4P57qPd1nVJkEbTD/q7fu6PK+EZGBQ1T9WXLpew3VLoJJ/Iklp+QKEAdYTkQ6PjaV6G
	 FP8irdSTscTr7NdZGIQbklT/YQRJlBcNHxjVtnEcQoUjuk8SON8ET+fU5+iQYHxxvbJ9w
	 acwuMy8t8XKY3iYce5MxqVh2a/P5rdiVdtrcFLiFDKiJ32tDTuS74En1E8vCoUE0VomLD
	 01XjVlqQr0nf2haH9n4X0RlabOv/cMNAuwjlK/xxSgSyhYaSXBEc889BE4KXxp2baPHHK
	 z3vo311zFeZHrd/WnBLwcV4sg//5mKsaAFspqqdkq0lw+Cpi4tB4eQr7QCqHfJtFjSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EtTG9ifD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17C3606A336;
	Mon,  9 Nov 2026 09:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EtTG9ifD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4C31F008A2;
	Mon,  9 Nov 2026 09:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794217242;
	bh=2Lhf1oVBUzjNJ7L7ccHNHY1ZkhYM/kcm/f0+29KNaVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EtTG9ifDodRJOB8+ggrbktVkdLsbeY5l9Na1ZYAYCT7eR82Y6sNwlWI/eG/en0noi
	 JSpIWOTHxTwTIE7NHoNVf6PsnQ0zppP4KuhUtbi9zGn/zMOULsj+ucbZFdY2a1jwsl
	 v0O2J7YTtmbqKkeKQPBPpDib4I5asR0YE5pMZXdC3mw9q50gZ12zRAIBQsRu1H8s1i
	 hoKkCzsx1JCbWYKpcpIXGfv2v2QLTjYPk9KZEx2ub2qpWQzRrVj/a/Q1w4MACE1n2F
	 J2um1Obp+kO+Urv3+ywFth1u58w/P/MyaxaNw2AkZR5O+g+N3Pd8qPM+7nLYsH3GD+
	 Goc8ooofKzdvg==
Date: Mon, 9 Nov 2026 09:40:38 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: raoxu <raoxu@uniontech.com>
Cc: linux@roeck-us.net, cristian.marussi@arm.com, marek.vasut@mailbox.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (scmi) Enable temperature sensors using their
 sensor IDs
Message-ID: <20261109-cheerful-panther-of-abracadabra-aa907b@sudeepholla>
References: <AED18609B941BCFD+20261109082854.3739085-1-raoxu@uniontech.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AED18609B941BCFD+20261109082854.3739085-1-raoxu@uniontech.com>

On Mon, Nov 09, 2026 at 04:28:54PM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> scmi_hwmon_probe() groups sensors by hwmon type, so the index in
> scmi_sensors->info[hwmon_temp] is not necessarily the SCMI sensor ID.
> Passing that index to config_set() targets a different sensor if the
> platform exposes non-temperature sensors ahead of temperature sensors.
> The intended temperature sensor can remain disabled, causing subsequent
> readings to fail. If configuring the wrong sensor fails, thermal
> registration of the intended sensor is also skipped.
> 
> Use the firmware sensor ID, as the read and thermal registration paths
> already do, so temperature sensors are enabled correctly.
> 
> The patch was reviewed and the commit message expanded with OpenCode
> AI assistance.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep
