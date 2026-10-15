Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEECB41DEEC;
	Thu, 15 Oct 2026 08:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054016; cv=none; b=ohk+FXqj3UoKhiaOyb/vm+E+O9QKv+7P7NGxxDEBEeJn7N+UW4GoPBziEjV3OAHtlnpHc4GLlvMAllcLd5IDOWJpTmK6y11ggWvrs7N89/SPeyBPRgQzEXZ4CeJTAv2dpYsXAQtUq/+jgcnZZORB7jenCKqM40C9lcjDrmM6h9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054016; c=relaxed/simple;
	bh=QxHnG2hK1KKJ/vJ5ufdFy2+7ahE6oXkVxbCSnwjM+uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnWSLP1LcvVL0web+gcD47oyItgvct6ccM7Uv7XVAGU/b3xG7pkfM7zF4MgjsPwPD0CzZM5mBsmu8q+3vcl6O30P0NCiqMmzXEwWVdMGtSBBmbH6kT4qmwwa5S7L3myCQ4T5N88/3SUHHjLbEb1NxY/WlyQ2M9GMIP3v/fRgfHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=K4mKVKwk; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="K4mKVKwk"
Received: from L18297.iliad.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 188EC78050E;
	Thu, 15 Oct 2026 10:46:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1792054006;
	bh=QxHnG2hK1KKJ/vJ5ufdFy2+7ahE6oXkVxbCSnwjM+uE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K4mKVKwkc2VZLjNXi0yKlBqNehmryr3uNoVSqOkQiDyFkQhG1lXkkv37RnfFDOjJ8
	 wwoBnY3OVG+tUKKEJY4etrwX128L7eaCyEhsK8DVmf2plUjlELXGYt2ytl65ELkDlc
	 4hO5e4YPMvd7PaNZ7CebeKLjQMl+1IgrQE9sdQWgSGZOS9jiMtNclQRWFADCHxBUDg
	 KLhKj9MXJL7VeexdG8d2+f7Tm2m82eAcFh6zoa2Z6FbMSeym/VAahme1io7aDULIAt
	 x+LEr9eGKXHjG9c5au3TXmFemXibdtp3BijKi4E1DVTY0L7ZFF2kKuHTBvwiJrelE1
	 Uif2yP7Pcfn+Q==
Date: Thu, 15 Oct 2026 10:46:35 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	Eduardo Valentin <eduval@amazon.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] hwmon: pmbus: 0-based thermal sensor index,
 mps,mpq8785 #thermal-sensor-cells
Message-ID: <atCS6zOqNzo30q3J@L18297.iliad.local>
References: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr>

Hi Guenter,

This one is a gentle ping on this series:
  https://lore.kernel.org/all/20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr/
  https://patchwork.kernel.org/project/linux-hwmon/patch/20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-1-bfafba9fcc95@free.fr/
  https://patchwork.kernel.org/project/linux-hwmon/patch/20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-2-bfafba9fcc95@free.fr/

Patch 1 is the pmbus_core fix you asked for (0-based thermal sensor
index, with your comment), and the patch 2 has the Conor's Acked-by.
Could you take them into hwmon-next for v7.4?

Thank you,
  Vincent
