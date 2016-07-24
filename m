Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:34714 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751258AbcGXGbV (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 24 Jul 2016 02:31:21 -0400
Received: by mail-lf0-f53.google.com with SMTP id l69so109522993lfg.1
        for <linux-hwmon@vger.kernel.org>; Sat, 23 Jul 2016 23:31:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <71a96a29-78e3-f251-dd8f-583031461678@riken.jp>
References: <02814a96-c620-c4af-e278-40432f6f701f@riken.jp>
 <9D204F6B-7C99-4543-87BF-4D9FC3F6475C@apm.com> <71a96a29-78e3-f251-dd8f-583031461678@riken.jp>
From: Loc Ho <lho@apm.com>
Date: Sat, 23 Jul 2016 23:31:18 -0700
Message-ID: <CAPw-ZTkXCe5ycO=e7FohbCbTXhMhqob8=a5gdOPezLMc0ubb=A@mail.gmail.com>
Subject: Re: hwmon: xgene: Add support for X-Gene hwmon driver
To: Itaru Kitayama <itaru.kitayama@riken.jp>
Cc: Hoan Tran <hotran@apm.com>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Ashwin Chaugule <ashwin.chaugule@linaro.org>,
	Duc Dang <dhdang@apm.com>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Itaru,

On Sat, Jul 23, 2016 at 10:04 PM, Itaru Kitayama
<itaru.kitayama@riken.jp> wrote:
>
> Hi Hoan,
>
> I didn't mention in my previous post, though I think I'm using fairly recent version of Tianocore F/W, and I can confirm there's the PCCT table,
>
> [    0.000000] ACPI: PCCT 0x00000047FA826000 000300 (v01 APM    XGENE 00000003      01000013)
>
> is this still not enough? If that's the case, I'll talk to APM for
> their latest development Tianocore version.

You will need the to be released FW version 3.06.xx or above. This new
FW won't be official release until at least a few months. If you want
to test this new firmware, we can get you an earlier image but there
will be very limited support. Though, Hoan will support you when
possible.

> Also, if you or your folks can fold your patch set into APM's xgene-next
> GitHub repo, that would help me to keep up with the development.

This can only get pull into xgene-next if it had accepted upstream.

-Loc
