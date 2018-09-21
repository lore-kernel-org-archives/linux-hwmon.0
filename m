Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-it1-f175.google.com ([209.85.166.175]:54428 "EHLO
        mail-it1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390726AbeIVDl7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Sep 2018 23:41:59 -0400
MIME-Version: 1.0
References: <20180921201252.12875-1-nicoleotsuka@gmail.com> <20180921201252.12875-2-nicoleotsuka@gmail.com>
In-Reply-To: <20180921201252.12875-2-nicoleotsuka@gmail.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
Date: Fri, 21 Sep 2018 14:51:01 -0700
Message-ID: <CAGoOwPTEEdzND3gCUP81weTUh3wkUeaLTqgmFANHknnyEaEijQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add ina3221 documentation
To: jdelvare@suse.com, Guenter Roeck <linux@roeck-us.net>,
        robh+dt@kernel.org, mark.rutland@arm.com,
        Jonathan Corbet <corbet@lwn.net>
Cc: afd@ti.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Found two mistakes at this doc, sending v3.

On Fri, Sep 21, 2018 at 1:12 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:

> +++ b/Documentation/devicetree/bindings/hwmon/ina3221.txt
> @@ -0,0 +1,38 @@
> +ina3221 properties
> +

Should be a description of the doc.

> +  VDD_GPU {
> +          shunt-resistor = <5>;

Should be <5000>.
