Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A415372688;
	Tue, 10 Mar 2026 10:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773139875; cv=none; b=XBgdgh5ig4q6UgX18YAQAfSbQNsLPHthjWz4UIj9pW7wQqf8T9k8pep6JdFqQyk9iYlQ30sGZYPqh/m3KCkijZmhcTdCzBhTfupcBKmdVKScJkm5lWVM3f1+e6KXM2vCoPx4kvR96BWd7PKe/12p83yZu2NHt1EMLnN4lC27ptY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773139875; c=relaxed/simple;
	bh=IC02AFMYqql7jnfQG4E0Bo/Kylh+iDF8UrqI5S8eao8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cSL9ucLSUbc/RXsK45rAF5Bxd27QI7+Sz4WEO+OKJVccQnhObNqKjHmDUIXuu4BSVh0q/CddyVB7UpYkoJqJm8ig7+NYHVty/SwcKWiNau/O1vPrWX7NENViM7tjUbKlOw3yBAhsIefyaQRB4Cp01cyqq6Q56+AGj6vOnizpZxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b68cef.dsl.pool.telekom.hu [::ffff:81.182.140.239])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000C70AA.0000000069AFF666.0005AFC6; Tue, 10 Mar 2026 11:45:58 +0100
Message-ID: <e0fb50490d733ad35807be79b6f4b91003897d10.camel@irl.hu>
Subject: Re: [PATCH 1/9] platform/x86: dell-descriptor: Use new buffer-based
 WMI API
From: Gergo Koteles <soyer@irl.hu>
To: Armin Wolf <W_Armin@gmx.de>,
  Pali =?ISO-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
  Mario Limonciello <mario.limonciello@amd.com>
Cc: Dell.Client.Kernel@dell.com, mjg59@srcf.ucam.org,
  hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
  platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux@roeck-us.net, linux-hwmon@vger.kernel.org
Date: Tue, 10 Mar 2026 11:46:04 +0100
In-Reply-To: <c1957ff4-964c-4651-93be-056ea4d9004d@gmx.de>
References: <20260308002522.4185-1-W_Armin@gmx.de>
	 <20260308002522.4185-2-W_Armin@gmx.de>
	 <39bdcdf7-a771-4f1b-a3a0-0ecde272d914@amd.com>
	 <20260309172309.a3ukif3bejbicywl@pali>
	 <c1957ff4-964c-4651-93be-056ea4d9004d@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Armin,

On Mon, 2026-03-09 at 20:45 +0100, Armin Wolf wrote:
> Am 09.03.26 um 18:23 schrieb Pali Roh=C3=A1r:
>=20
> > On Monday 09 March 2026 10:41:20 Mario Limonciello wrote:
> > > On 3/7/2026 6:25 PM, Armin Wolf wrote:
> > > > +	/* "DELL" */
> > > > +	if (le32_to_cpu(desc->vendor_signature) !=3D 0x4C4C4544) {
> > > Do you think you could come up with a helper for matching an expected
> > > "string" like this?  I /suspect/ it's going to be a common pattern th=
at
> > > vendors use and it will increase code readability going forward if a =
helper
> > > is possible.  I see it at least twice in this patch alone.
> > >=20
> > > Something like this prototype:
> > >=20
> > > bool wmi_valid_signature(u32 field, const char* expected_str);
> > When I read your comment, I come to another idea. What about introducin=
g
> > a macro which will convert 4-byte string to u32 number? For example:
> >=20
> >    #define str_to_u32(str) ({ _Static_assert(__builtin_types_compatible=
_p(__typeof__(str), char[5]), "wrong type"); (u32)(u8)(str)[0] | ((u32)((u8=
)(str)[1]) << 8) | ((u32)((u8)(str)[2]) << 16) | ((u32)((u8)(str)[3]) << 24=
); })
> >=20
> > The whole conversion would be done in compile time (with -O2) so should
> > not cause any possible performance issues.
> >=20
> > With it, the condition could be written as:
> >=20
> >    if (le32_to_cpu(desc->vendor_signature) !=3D str_to_u32("DELL")) {
> >=20
> > and no need to use magic number 0x4C4C4544 and write comment that this
> > number in ASCII is the "DELL" string.
>=20
> To be honest i do nothing think that having a helper function for this in=
side the WMI driver core
> is useful, especially since most vendors other than Dell do not use such =
magic numbers.
>=20
>  From my perspective assembling the two constants ourself is fine here.
>=20

But what about the other readers? :)

Why don't you use a char array for the descriptors?

struct descriptor {
	char vendor_signature[4];
	char object_signature[4];
	__le32 interface_version;
	__le32 buffer_length;
	__le32 hotfix_number;
} __packed;

Best regards,
Gergo Koteles
