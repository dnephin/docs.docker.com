# Project requirements

The 1.0 project implementation is due by Dockercon 2015. This page defines the requirements for that version. The requirement categories within each component are:

<table>
  <tr>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <th>Must Have</th>
    <td>Necessary for the project to be a success. </td>
  </tr>
  <tr>
    <th>Nice to have</th>
    <td>If implemented, the project exceeds expectations.</td>
  </tr>
  <tr>
    <th>Wishlist</th>
    <td>If implemented, someone magical is owed a first-born child of the king.</td>
  </tr>
</table>

## Authoring tooling requirements

The software used to write the documentation.  This includes ancillary tools such as spell checkers, grammar checkers, and screenshot tools. 

### Must have requirements

- The tooling should be free, easy to learn, easy to use, and widely supported.
- Documentation source should be kept with the project/product code.
- Authoring should not require special tools or complex configurations.
- Authors should be able to view a contribution in context of the larger documentation set.
- Authors should be able to create links between documents in different GitHub projects or products.

### Nice to have requirements

- Code needed to generate from Markdown should not appear in repository display 


### Wishlist items

- Documentation should allow live refresh while authoring
- Checkin of .md files should be run against a spell checker and return warnings
- Checkin of .md files should return a warning for a low Fleisch index

## Site design requirements

The look-and-feel of the documentation as it displays in a website.  Typically, this is the assets used to produce the site.  It also includes ancillary tools and utilities such as source control, CMS, and search APIs.


### Must have requirements

- Documentation should use a look-and-feel that works with the Docker company Site

### Nice to have requirements

- Display previous versions of the documentation 
- Embedded, site specific search

### Wishlist requirements
 
- pretty print from navigation tree
 
## Build tooling

The software and scripts required to compile the documentation source files and make it ready for presentation. Typically, this is a package for generating output from documentation source files. This also includes ancillary tools and utilities such as presentation platforms, and so forth.

### Must have requirements

- Authors should be able to both preview what they write in the same format as the final website. 
- Local builds should pull from master documentation across the projects; this applies only to content the author is not working on

## Nice to have requirements

- Documentation should display well in repository and on a static site.

### Wishlist requirements


## Release tooling

This is the software and scripts used to release the software for public consumption. 

### Must have requirements

- Engineering team should own  the account that has the `docs.docker.com` bucket. 


### Nice to have requirements

- `docs/Dockerfile` should build from global release values  

### Wishlist requirements