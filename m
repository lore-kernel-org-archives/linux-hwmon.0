Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [4.193.249.245])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A2637AA65;
	Mon, 29 Jun 2026 03:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.193.249.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782703134; cv=none; b=nHuywr73TMKmIEiwjHYbRwBsw7xNnRnRzr3ugVGVKsR21eaj3fk9CoEXaQI7M7suhN4qJft6KckvBsdyYlmUm4NnDIDS23yMAKKEdq6Vz5kRsypO+cobhxfTxCJtlo9kweLKFMI3N0WZi5+dvPl+kodOkIQVNgEOI3/eIcwHehA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782703134; c=relaxed/simple;
	bh=2i619orZh5e90Wzn6bgcBluE0cdAT/VejJqmigtzTTw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=BLYWSTjBB8ccKnqj8i7lcYhdjsnNC3TgIZhz9TMqV7Wrb6oiLmhRrCEh6tSlt+idV0HRKPwvAjw48BGah8Avdg61FLDl/r+Ew+3eq5BfZr8Xrcf+V5IodfCnlVQYkrk9Va65C8h1A5wEI67xe9hy1xmAaAJb9B7EViHwoxXy7yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=4.193.249.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from dongxuyang$eswincomputing.com ( [10.12.96.41] ) by
 ajax-webmail-app2 (Coremail) ; Mon, 29 Jun 2026 11:18:36 +0800 (GMT+08:00)
Date: Mon, 29 Jun 2026 11:18:36 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Xuyang Dong" <dongxuyang@eswincomputing.com>
To: "Julian Braha" <julianbraha@gmail.com>, linux@roeck-us.net,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	p.zabel@pengutronix.de, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, luyulin@eswincomputing.com
Subject: Re: Re: [PATCH v8 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <66945d22-17e4-4856-9704-8256650c4b25@gmail.com>
References: <20260625061049.1614-1-hehuan1@eswincomputing.com>
 <20260625061214.1648-1-hehuan1@eswincomputing.com>
 <66945d22-17e4-4856-9704-8256650c4b25@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <720f0b80.7c8d.19f1162d004.Coremail.dongxuyang@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgAnPJ8M5EFq_MEvAA--.6523W
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/1tbiAQENAmpBTKQXh
	wABsd
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWUJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

SGkgSnVsaWFuLAoKPiAKPiBPbiA2LzI1LzI2IDA3OjEyLCBoZWh1YW4xQGVzd2luY29tcHV0aW5n
LmNvbSB3cm90ZToKPiA+ICtjb25maWcgU0VOU09SU19FSUM3NzAwX1BWVAo+ID4gKwl0cmlzdGF0
ZSAiRXN3aW4gRUlDNzcwMCBWb2x0YWdlLCBUZW1wZXJhdHVyZSBzZW5zb3IgZHJpdmVyIgo+ID4g
KwlkZXBlbmRzIG9uIEFSQ0hfRVNXSU4gfHwgQ09NUElMRV9URVNUCj4gPiArCWRlcGVuZHMgb24g
SFdNT04KPiAKPiBZb3UgYWxyZWFkeSBwdXQgU0VOU09SU19FSUM3NzAwX1BWVCBpbnNpZGUgdGhl
ICdpZiBIV01PTiAuLiBlbmRpZicsIHNvCj4geW91IGRvbid0IG5lZWQgdGhlICdkZXBlbmRzIG9u
IEhXTU9OJy4gSXQgY3JlYXRlcyBhIGR1cGxpY2F0ZQo+IGRlcGVuZGVuY3kuCj4gCgpXaWxsIGRy
b3AgdGhlICdkZXBlbmRzIG9uIEhXTU9OJyBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKQmVzdCByZWdh
cmRzLApYdXlhbmcgRG9uZwoK
